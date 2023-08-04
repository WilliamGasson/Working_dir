import pandas as pd
import numpy as np
from dataclasses import dataclass
from typing import Optional
import datetime
from SummaryReport import SummaryReport

class MonitorQC:
    """
    A class to take the QC files and append them to the errors_log,
    also to display the result so any errors are clear and the steps
    that need to be taken are obvious
    """
    def __init__(self, data_path, qc_path, email_mapping_path, error_log_path):
        self.dataframe = pd.read_excel(data_path)
        self.qc_report = pd.read_csv(qc_path)
        self.email_mapping = pd.read_excel(email_mapping_path)
        self.error_log = pd.read_csv(error_log_path)

        self.summary_report = SummaryReport()
        self.summary_report_location = "data/PAC8_sumary_report.csv"

    def extend_qc(self):
        """
        Add date, sample_id, labname, subject_id to the qc report
        """
        self.qc_report["sample_id"] = self.dataframe.loc[self.qc_report["index"],self.dataframe["sample_id"]]
        self.qc_report["subject_id"] = self.dataframe.loc[self.qc_report["index"],self.dataframe["subject_id"]]
        self.qc_report["labname"] = self.dataframe.loc[self.qc_report["index"],self.dataframe["labname"]]
        self.qc_report["date"] = self.dataframe.loc[self.qc_report["index"],self.dataframe["sample_id"]]

        self.qc_report["Fixed"] = 0

    def append_qc(self):
        """
        Add the latest QC errors to the Error_Log
        check if there is a matching error already, if so mark it as not fixed
        Check if any have been fixed and mark them as closed
        """
        error_log = self.error_log.join(self.qc_report)
        return error_log

    def create_tc(self, df):
        """
        cleans RTPROS column and replaces not applicable with nan and
        """
        df["TC"] = df["RTPRPOS"]
        df["TC"] = df["TC"].replace('NOT APPLICABLE', np.nan)
        df["TC"] = df["TC"].replace('<1%', 0.005)
        df["TC"] = df["TC"]*100
        return df

    def clean_dates(self, df, column):
        """
        cleans date column and replaces not applicable with nan and
        """
        df[column].replace('NOT APPLICABLE', np.nan, inplace=True)
        df[column] = df[column].values.astype('datetime64[D]')

        return df

    def calculate_tat(self, df):
        """
        Average TAT
        TAT average initial
        TAT average repeat
        """

        def workday_count(row):
            if pd.notnull(row["STAINDT"]) and pd.notnull(row["BMREDAT"]):
                return np.busday_count(pd.to_datetime(row["STAINDT"]).date(), pd.to_datetime(row["BMREDAT"]).date())
            else:
                return np.nan

        df["TAT"]= df.apply(workday_count, axis=1)

        return df

    def add_failtype(self, df):
        df['failtype'] = "False"

        df.loc[
            (df["RTPRPOS"] != "NOT APPLICABLE") |
            (df["RTPRPOS"] != "NOT EVALUABLE"),
            "failtype"
            ] = "PASS"

        df.loc[
            (df['SAMPACC'] == "NOT APPLICABLE") |
            (df['SAMPACC'] == "NO" )|
            (df['RUNNUM'] == "NOT APPLICABLE" )|
            (df["HEACCP"] == "NO") |
            (df["CSNCNTR"] == "NO") |
            (df["IHCVIA"] == "NO") |
            (df["CSMORPH"] == "NO") |
            (df["CSBCKGR"] == "NO") |
            (df["STAINPER"] == "NO") |
            (df["BMGEDES"].str.contains("specimen|tissue|tumor|background unacceptable|morphology|staining|technical",case = False)) |
            (df["BMCOM"].str.contains("specimen|tissue|tumor|background unacceptable|morphology|staining|technical",case = False)),
            'failtype'
            ] = "SampleQC"

        df.loc[
            (df['RUNCONT'] == "NO") |
            (df["BMGEDES"].str.contains("run|control", case = False)) |
            (df["BMCOM"].str.contains("run|control", case = False)),
            'failtype'
            ] = "AssayQC"

        return df

    def preprocess_df(self):
        """
        Function to run preprocessing and add columns
        """
        self.dataframe = self.create_tc(self.dataframe)

        date_cols = ["BMREDAT", "SPECDAT", "STAINDT", "READDT"]

        for date_col in date_cols:
            self.dataframe = self.clean_dates(self.dataframe, date_col)

        self.dataframe = self.calculate_tat(self.dataframe)

        self.dataframe = self.add_failtype(self.dataframe)

    def prepare_records(self):
        self.preprocess_df()
        self.summary_report.prepare_summary_report(self.dataframe)
        #print(self.summary_report.summary_df)
        self.summary_report.save(self.summary_report_location)



if __name__ == "__main__":
    qc = MonitorQC(data_path='data/PAC8_data_report.xlsx',
                   qc_path='data/PAC8_qc_report.csv',
                   email_mapping_path='data/MappingFileMasterSheet_PAC8.xlsx',
                   error_log_path='data/ERROR_LOG.csv')

    qc.prepare_records()

    # report.to_csv("data/PAC8_summary_report.csv")

