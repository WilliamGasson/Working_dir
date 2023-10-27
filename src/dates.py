#%% Imports
import pandas as pd
import numpy as np
import datetime

#%% Capitals
column = "dd-MMM-yyyy"

format = "ISO8601"

df = pd.DataFrame({"dd-MMM-yyyy":['01-JAN-2022', '02-JAN-2022'],"dd-Mmm-yyyy":['01-Jan-2022', '02-Jan-2022']})

try:
    pd.to_datetime(df[column], format=format, errors='raise')
    print("all good")
except ValueError:
    print(f"column: {column} has incorrect date formats: {format}")
    

#%%

from dateutil.parser import parse

def detect_date_format(date_str):
    date_formats = [
        '%Y-%m-%d',          # YYYY-MM-DD
        '%d-%m-%Y',          # DD-MM-YYYY
        '%m-%d-%Y',          # MM-DD-YYYY
        '%Y/%m/%d',          # YYYY/MM/DD
        '%d/%m/%Y',          # DD/MM/YYYY
        '%m/%d/%Y',          # MM/DD/YYYY
        '%d-%b-%Y',          # DD-Mon-YYYY (e.g., 01-Mar-2022)
        '%d %b %Y',          # DD Mon YYYY (e.g., 01 Mar 2022)
        '%d%b%Y',            # DDMonYYYY (e.g., 01Mar2022)
        '%d-%b-%Y'.replace('-', '').upper(),  # DD-MON-YYYY (e.g., 01-MAR-2022)
        '%d %b %Y'.replace(' ', '').upper(),  # DDMMONYYYY (e.g., 01MAR2022)
    ]

    for date_format in date_formats:
        try:
            parsed_date = parse(date_str, fuzzy=True)
            if parsed_date.strftime(date_format) == date_str:
                return date_format
        except ValueError:
            pass

    return "Date format not recognized"

# Test cases
date_str1 = "2022-03-01"
date_str2 = "01-Mar-2022"
date_str3 = "01-MAR-2022"
date_str4 = "March 01, 2022"

print(f"Date format 1: {detect_date_format(date_str1)}")
print(f"Date format 2: {detect_date_format(date_str2)}")
print(f"Date format 3: {detect_date_format(date_str3)}")
print(f"Date format 4: {detect_date_format(date_str4)}")



#%% Capitals

# Sample DataFrame with a date column
data = {'date_column': ['01-Mar-2023', '02-APR-2023',"np.nan",np.nan]}
df = pd.DataFrame(data)

# Define the input date format
input_format = "mixed"

# Define the desired output format (e.g., "YYYY-MM-DD")
output_format = "%d-%b-%Y"

# Convert the date column to datetime
df['date_column'] = pd.to_datetime(df['date_column'], format="mixed", dayfirst=True, errors="coerce")

# Convert the datetime column to the desired output format
df['date_column'] = df['date_column'].dt.strftime("%d-%b-%Y")
print(df.dtypes)
print(df)



#%% conditions


BMREDAT = "NOT APPLICABLE"
SAMPACC = "YES"
TCPOS1 = "NOT APPLICABLE"
RTPRPOS = "NOT APPLICABLE"
RUNNUM = "NOT APPLICABLE"


if SAMPACC == "":
    bmredcheck = "NA", 
elif  SAMPACC == "NOT APPLICABLE":
    bmredcheck = "NA",
    
elif  SAMPACC == "YES" and  BMREDAT == "NOT APPLICABLE" and TCPOS1 == "NOT APPLICABLE":
    bmredcheck = "TRUE", 
elif SAMPACC == "YES" and BMREDAT == "":
    bmredcheck ="FALSE", 
else:
    bmredcheck ="TRUE"


if SAMPACC == "" or BMREDAT == "":
    check = "NA"
elif RUNNUM == "NOT APPLICABLE" and BMREDAT == "NOT APPLICABLE":
    check = "TRUE"
elif SAMPACC == "NO" or SAMPACC == "NOT APPLICABLE":
    check = "TRUE"
elif RTPRPOS == "NOT APPLICABLE" or  RTPRPOS == "not evaluable":
    check = "TRUE" 
elif BMREDAT.format == "dd-mmm-yyyy":
    chekc = "FALSE", 
else:
    check = "TRUE"



# %%

dataframe = {'date_column': ['01-Mar-2023', '02-APR-2023',"np.nan",np.nan]}

format = "%d-%b-%Y"
column = 'date_column'

try:
    pd.to_datetime(dataframe[column], format=format, errors='raise')
except ValueError:
    print("column", "column has incorrect date formats", column, format)
    
    for value in dataframe[column]:
        try:
            datetime.datetime.strptime(value, format)
        except (ValueError, TypeError):
            print("index", "date value in incorrect format", column, str(value))


# %%
