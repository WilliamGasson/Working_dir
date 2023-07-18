import pandas as pd
from datetime import datetime

data = {'date1':['11/03/2023','11/03/2023','11/03/2023','11/03/2023'],
        'date2':['12/03/2023','11/04/2023','11/03/2022','14/04/2024']}
                   
dataframe = pd.DataFrame(data)

column = ['date1','date2']

print(column[0])

for index, (date_0, date_1) in enumerate(zip(dataframe[column[0]], dataframe[column[1]])):

    date_col0 = datetime.strptime(date_0, '%d/%m/%Y').date()
    date_col1 = datetime.strptime(date_1, '%d/%m/%Y').date()  

    diff = date_col1 - date_col0
    
    if diff.total_seconds() < 0:  
    
        print(column, index, diff)

