import pandas as pd
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
        self.qc_log = pd.read_csv(error_log_path)
        self.error_log_path = error_log_path

    def append_qc(self):
        """
        Add the latest QC errors to the Error_Log
        check if there is a matching error already, if so mark it as not fixed
        check if any have been fixed
        add date, sample_id, labname, subject_id
        """
        pass

    def calc_summary(self):
        """
        Caluculate the prevalences of TCPOS1 against
        sample_id and subject_id
        sample prevalence
        subject prevalence
        failure rate
        average TAT
        TAT average initial
        TAT average repeat
        QC fail count
        Assay fail count

        """
        datafame_patient_group = self.dataframe.groupby("SUBJECT")
        datafame_sample_group = self.dataframe.groupby("SPECID")

        sample_pivot = pd.pivot_table(self.dataframe, index=['SPECID'], columns=['SPECID'],values=['TCPOS1'], aggfunc="count")
        print("sample_pivot:", sample_pivot)
        tcpos_count = self.dataframe['TCPOS1'].value_counts()['YES']
        print("tcpos_count:", tcpos_count)


        # prevalence = tcpos1_pos / self.dataframe.shape[0]
        # print('prev1:', prevalence)

        # tcpos_count1 = self.dataframe.groupby("SUBJECT").TCPOS1.value_counts().sum()
        # print("tcpos_count1", tcpos_count1)
        # prev2 = self.dataframe.TCPOS1.value_counts(normalize=True)
        # print("prev2:", prev2)

    def display_monitoring(self):
        """ Outputs QC checks and summary in a neat format to
        show the state of the study
        """
        print(self.dataframe.head())


if __name__ == "__main__":
    qc = MonitorQC(data_path='data/PAC8_data_report.xlsx',
                   qc_path='data/PAC8_qc_report.csv',
                   email_mapping_path='data/MappingFileMasterSheet_PAC8.xlsx',
                   error_log_path='data/ERROR_LOG.csv')

    qc.calc_summary()
