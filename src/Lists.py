import pandas as pd

# Sample DataFrame with mixed columns
data = {'column1': [1, 2, 1, 4, 2],
        'column2': [[1, 2], [2, 3], [1, 2], [4, 5], [2, 3]],
        'column3': ['A', 'B', 'A', 'D', 'C']}
df = pd.DataFrame(data)

# Create a new DataFrame with a hashable representation of each row
df['row_representation'] = df.apply(tuple, axis=1)

# Drop duplicates based on the new 'row_representation' column
df = df.drop_duplicates(subset='row_representation')

# Remove the 'row_representation' column (optional)
df = df.drop(columns=['row_representation'])

print(df)
