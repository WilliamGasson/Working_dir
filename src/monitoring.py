import pandas as pd
import numpy as np
from dataclasses import dataclass
from typing import Optional
import datetime


@dataclass
class qc_report():
    """
    Dataclass from qc_report format
    """
    id: str
    scope: str
    step: str
    severity: str
    message: str
    column: str
    index: str
    value: str


@dataclass
class dataframe():
    """
    Dataclass to map the data from the clinical trial
    """
    STUDY: str
    INDICAT: str
    LABNAME: str
    SUBJECT: str
    CENTRE: int
    SPECID: str
    LABACSL: str
    SPECDAT: datetime.datetime
    RECEDT: datetime.datetime
    BMREDAT: datetime.datetime
    TYPSPEC: str
    BLOCKNUM: str
    BLOCKID: str
    SLIDENUM: str
    SECDT: str
    SECMIC: str
    TYPTUM: str
    PRITUM: str
    FIXATIVE: str
    FIXSPEC: str
    FIXTIME: str
    COLECM: str
    SAMPACC: str
    SAMPREAS: str
    RUNNUM: str
    STAINDT: datetime.datetime
    READDT: datetime.datetime
    CSSTAT: str
    RUNCONT: str
    RUNCREAS: str
    RUNCRESP: str
    HEACCP: str
    CSNCNTR: str
    IHCVIA: str
    CSMORPH: str
    CSBCKGR: str
    STAINPER: str
    RTPRPOS: int
    TCPOS1: str
    TCPOS10: str
    TCPOS25: str
    TCPOS50: str
    ICTOTAL: str
    ICPOSPDP: str
    ICPOSLS: str
    ICPOSS: str
    ICPOS25: str
    BMGEDES: str
    BMCOM: str
    PATHNM: str
    dx: Optional[str]
    assay: Optional[str]
    qcpass: Optional[str]
    filename: Optional[str]
    TAT: Optional[str]
    SampleAge: Optional[str]


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


    def extend_qc(self):
        """
        Add date, sample_id, labname, subject_id to the qc report
        """
        self.qc_report
        
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
        df.replace('not applicable', np.nan, inplace=True)

        return df

    def calculate_TAT(self, df):
        """
        Average TAT
        TAT average initial
        TAT average repeat
        """
        df.replace('not applicable', np.nan, inplace=True)

        df["TAT"] = (df["STAINDT"] - df["BMREDAT"]).dt.days
        # df["TAT"] = np.busday_count(df['STAINDT'], df['BMREDAT']) -1


        # if df['BMREDAT'] == "" or df['RECEDT'] == "": 
        #     tat = "MISSING DATE",
        #     if df['CSSTAT'] == "":
        #         tat = "NOT TESTED" 
        #         if df['CSSTAT'] == "NOT APPLICABLE":
        #             tat = "NOT TESTED" 
        #             if df['BMREDAT'] == "NOT APPLICABLE":
        #                 tat = "NOT TESTED"
        #                 if df.loc[df['CSSTAT'].str.contains("Repeat", case = False)]:
        #                   tat = np.busday_count(df['STAINDT'], df['BMREDAT']) -1, 
        #                 else:
        #                     tat = ""
        return df
    
    def preprocess_df(self):
        """
        Function to run preprocessing and add columns
        """
        self.dataframe = self.create_tc(self.dataframe)

        self.dataframe = self.calculate_TAT(self.dataframe)

    def calculate_prevalence(self, df, group, column):
        """
        Caluculate the prevalences of TCPOS1 against
        sample_id and subject_id
        sample prevalence
        subject prevalence
        failure rate
        QC fail count
        Assay fail count
        """        
        # if yes isnumber val = "positive" elif no isnumber val = "negative" else val = "fail"
        # postive count is the number of patients - number that are not positive

        df = df[[group, column]]
        patient_pivot2 = df.set_index(group).stack().str.get_dummies().sum(level=0)

        patient_count = df[group].nunique()
        yes_count = patient_count - patient_pivot2.YES.value_counts()[0]

        no_count = patient_count - patient_pivot2.NO.value_counts()[0]
        print(patient_pivot2.NO.value_counts())

        prevalence = (yes_count)/(yes_count + no_count)
        fail_count = patient_count - no_count - yes_count

        return patient_count, prevalence, yes_count, no_count, fail_count

    def prepare_summary_report(self):
        """ Outputs QC checks and summary in a neat format to
        show the state of the study
        """
        df = self.dataframe

        # df = self.calculate_TAT(df)


        summary_df = pd.DataFrame(columns = ["group", "column","patient_count","prevalence","yes_count", "no_count",  "fail_count"])
        for group in ["SUBJECT", "SPECID"]:
            for column in ["TCPOS1","TCPOS10","TCPOS25","TCPOS50"]:
                patient_count, prevalence, yes_count, no_count, fail_count = self.calculate_prevalence(df, group, column)


                summary_df.loc[len(summary_df.index)] = (group, column, patient_count, prevalence, yes_count, no_count, fail_count)
        return summary_df



if __name__ == "__main__":
    qc = MonitorQC(data_path='data/PAC8_data_report.xlsx',
                   qc_path='data/PAC8_qc_report.csv',
                   email_mapping_path='data/MappingFileMasterSheet_PAC8.xlsx',
                   error_log_path='data/ERROR_LOG.csv')
    
    qc.preprocess_df()
    
    report = qc.prepare_summary_report()
    print(report)

    # report.to_csv("data/PAC8_summary_report.csv")
    
