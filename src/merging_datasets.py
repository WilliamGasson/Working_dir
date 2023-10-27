import pandas as pd
import numpy as np


def extend_qc(qc_report, df, subject_col, sample_col, labname ):
    """ Adds to the QC report by finding the subject id column, 
    the sample id, labname and time and adding them to each error
    """
    df = df[[subject_col,sample_col,labname]].copy()
    qc_report['index'] = qc_report['index'].apply(lambda x: int(x) if x != '' else None)
    qc_report['index'] = pd.to_numeric(qc_report['index'], errors='coerce')
    print(qc_report.dtypes)

    qc_report = qc_report.merge(df, left_on='index', right_index=True, how='left')
    qc_report["time"] = pd.Timestamp.today().strftime('%Y-%m-%d')
    qc_report["time"] =  qc_report["time"].astype(str)
    qc_report["active"] = True
    return qc_report


df = pd.DataFrame(columns=["STUDY",	"INDIC",	"LABNAME",	"SUBJECT",	"CENTRE",	"SPECID"], 
                  data= [["D798AC00001",	"NSCLC",	"HEMATOGENIX",	"E9999001",	"9999",	"1234567890"],
                         ["D798AC00001",	"NSCLC",	"HEMATOGENIX",	"E9999002",	"9999",	"1234567891"],
                         ["D798AC00001",	"NSCLC",	"HEMATOGENIX",	"E9999002",	"9999",	"1234567891"],
                         ["D798AC00002",	"NSCLC",	"HEMATOGENIX",	"E9999003",	"9999",	"1234567893"],
                         ["D798AC00003",	"NSCLC",	"HEMATOGENIX",	"E9999004",	"9999",	"1234567894"]])


qc_report = pd.DataFrame(columns=["scope","step","severity","message","column","index","value"],
                         data = [["column","CheckColumnMatchesExpression_8","INFO","dataframe invalid after applying condition","centre","","subject.str.startswith('^E0')"],
                                 ["column","CheckColumnIsNumeric_13","WARNING","column contains non-numeric values","blocknum","",""],
                                 ["column","CheckColumnMatchesExpression_17","WARNING","column values do not match" "expression","secmic","","^(4UM|5UM)$"],
                                 ["index","CheckColumnMatchesExpression_17","WARNING","row value does not match expression: ^(4UM|5UM)$","secmic","3","2UM"],
                                 ["column","CheckColumnIsNotBlank_30","INFO","dataframe invalid after applying condition","pathnm","","rtprpos == 'NOT APPLICABLE' & runnum == ''"],
                                 ["column","CheckColumnMatchesExpression_33","INFO","dataframe invalid after applying condition","readdt","","sampacc == 'YES' & runnum == 'NOT APPLICABLE'"],
                                 ["column","CheckColumnMatchesExpression_35","INFO","dataframe invalid after applying condition","tcpos1","","sampacc == 'YES' and tc >=25"],
                                 ["column","CheckColumnMatchesExpression_36","INFO","dataframe invalid after applying condition","tcpos10","","sampacc == 'YES' and tc >=25"],
                                 ["column","CheckColumnMatchesExpression_37","INFO","dataframe invalid after applying condition","tcpos25","","sampacc == 'YES' and tc >=25"],
                                 ["column","CheckColumnMatchesExpression_38","INFO","dataframe invalid after applying condition","tcpos50","","sampacc == 'YES' and tc >=50"]])

subject_col = "STUDY"
sample_col = "SPECID"
labname ="LABNAME"
qc_report.to_csv("test_qc_report.csv")
print(df.dtypes)
print(qc_report.dtypes)

# qc_report['index'] = pd.to_numeric(qc_report['index'], errors='coerce').fillna(np.nan).astype(int)

qc_report = extend_qc(qc_report, df,subject_col, sample_col, labname )

