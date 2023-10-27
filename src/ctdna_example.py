import solvebio
from solvebio import Object, Vault, GlobalSearch
import pandas as pd
solvebio.login()

filename = 2086950939454842513
full_path = "astrazeneca:PACIFIC-8_D9075C00001_Dx"

# Other functions
# search = GlobalSearch(query=f'type:vault AND vault_id:6618 AND tags:current')
# vault = Vault.get_by_full_path(full_path)
# vault.create_folder(folder_name, local_path)
# Retrieve a vault vault = Vault.get_personal_vault()
# sb_object = Object.retrieve(filename)


sb_vault = Vault.retrieve(6618)

# folder = Object.get_by_full_path(f"{sb_vault}:test")


from solvebio import Object, Vault

# Retrieve a vault
vault = Vault.get_personal_vault()


folder = Object.get_by_full_path("astrazeneca:user-4709:/qc_and_monitoring")

for child_folder in folder.folders():
    print(child_folder.full_path)


file = Object.get_by_full_path("astrazeneca:user-4709:/qc_and_monitoring/PACIFIC8_test_data-2Hematogenix_SP263_pathologist_2023_08_22_16:05:46_qc_report.csv")

path = file.download("~/Documents")
df = pd.read_csv(path)

df.to_csv("~/yourfiles")

report_file = Object.upload_file(local_path="~/yourfiles",remote_path="folders/filename",vault_full_path="vaultname")

Object.delete()
