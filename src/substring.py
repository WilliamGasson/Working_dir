import pandas as pd

data = {'subjid': ['E7601001', 'E75022002', 'E7501003','E0750103'], 'centre': ['7601', '7501','7501','7501']}

df = pd.DataFrame(data)

column = 'subjid'

substring = 'centre'

# Check if the substring 'bar' is present in column 'B'
result = df.apply(lambda x: x[substring] in x[column][1:5], axis=1)

for i, val in enumerate(result):
    if val == False:
        print(val)