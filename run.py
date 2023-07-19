import pandas as pd
from src.monitoring import MonitorQC


if __name__ == "__main__":
    qc = MonitorQC(data_path='data/PAC8_data_report.xlsx',
                   qc_path='data/PAC8_qc_report.csv',
                   email_mapping_path='data/MappingFileMasterSheet_PAC8.xlsx',
                   error_log_path='data/ERROR_LOG.csv')

    report = qc.prepare_summary_report()
    print(report)

    report.to_csv("data/PAC8_summary_report.csv")
    
