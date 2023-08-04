"""
SummaryReport class
"""
from datetime import datetime
import pandas as pd
import numpy as np

class SummaryReport:
    """
    summary report has prepare summary report and save summary report
    """
    def __init__(self):
        self.summary_df = None
        self.summary_report_location = None

    def calculate_fails(self, df, group, column):
        pivot = pd.get_dummies(df[[group, column]].set_index(group), prefix="", prefix_sep="")
        grouped_pivot = pivot.groupby(group).sum()

        unique_count = df[group].nunique()
        pass_count = unique_count - grouped_pivot.PASS.value_counts()[0]
        assay_count = unique_count - grouped_pivot.AssayQC.value_counts()[0]
        sample_count = unique_count - pass_count - assay_count

        return pass_count, assay_count, sample_count

        
    def calculate_prevalences(self, df, group, column):
        """
        Calculate the prevalences of TCPOS1 against sample_id and subject_id
        return the sample prevalence subject prevalence failure rate QC fail count Assay fail count
        """
        # if yes isnumber val = "positive" elif no isnumber val = "negative" else val = "fail"
        # postive count is the number of patients - number that are not positive

        pivot = pd.get_dummies(df[[group, column]].set_index(group), prefix='', prefix_sep='') # Pivot table
        grouped_pivot = pivot.groupby(group).sum()                            # Group by patient/sample

        unique_count = df[group].nunique()
        yes_count = unique_count - grouped_pivot.YES.value_counts()[0]
        no_count = unique_count - grouped_pivot.NO.value_counts()[0]
        prevalence = (yes_count)/(yes_count + no_count)
        fail_count = unique_count - no_count - yes_count

        return unique_count, prevalence, yes_count, no_count, fail_count

    def prepare_summary_report(self, df):
        """Prepare a Summary report
        Args:
            df (Pandas DataFrame): Dataframe to report on
            qc_report (Pandas DataFrame): The latest qc_report
        Returns:
            Summary report: returns summary of table and errors
        """

        self.summary_df = pd.DataFrame(columns = ["group", "column","patient_count","prevalence","yes_count", "no_count",  "fail_count"])
        for group in ["SUBJECT", "SPECID"]:
            for column in ["TCPOS1","TCPOS10","TCPOS25","TCPOS50"]:
                patient_count, prevalence, yes_count, no_count, fail_count = self.calculate_prevalences(df, group, column)

                self.summary_df.loc[len(self.summary_df.index)] = (group, column, patient_count, prevalence, yes_count, no_count, fail_count)

        print(self.calculate_fails(df, "SPECID", "failtype"))

        self.summary_df["av_tat_inital"] = df.loc[df['CSSTAT'] == "INITIAL", "TAT"].mean()
        self.summary_df["av_tat_repeat"] = df.loc[df['CSSTAT'].str.contains("REPEAT"), "TAT"].mean()
        return self.summary_df

    def save(self, summary_report_location):
        """
        Save to the temp/summary as csv
        """
        current_date = datetime.today().strftime('%Y_%m_%d')

        return self.summary_df.to_csv(f"data/PAC8_summary_report.csv")
