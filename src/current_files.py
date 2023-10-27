import solvebio
from solvebio import Object, Vault, GlobalSearch
import pandas as pd
solvebio.login()

CURRENT_TAG = "current"
# qc_folder = Object.get_by_full_path("astrazeneca:user-4709:/qc_and_monitoring")

# files = {file.id : file.tags for file in qc_folder.files()}

# for file_id, file_tags in files.items():
#     if CURRENT_TAG in file_tags:
#         file_obj = Object.retrieve(file_id)
#         file_obj.tag([CURRENT_TAG], remove=True, apply_save=True)

# current_file_ids = [file for file in file_ids if CURRENT_TAG in file.tags]

# print(current_file_ids)

# if not isinstance(file_tags, list):
#     file_tags = [file_tags]
#     # Filter only files for supplier with Current and Supplier and file tags
#     files_current = [d for d in files if "current" in d.tags and all(
#         file_tag.lower() in [tag.lower() for tag in d.tags] for file_tag in file_tags)]
#     files_supplier = [d for d in files_current if supplier.lower() in [tag.lower() for tag in d.tags]]

# # remove Current tag from old file
# for file in files_supplier:
#     obj = file.vault_object
#     obj.tag(["current"], remove=True, apply_save=True)


folder_path = "astrazeneca:user-4709:/qc_and_monitoring/image_error_log"

def load_historic_log(folder_path):
    folder = Object.get_by_full_path(folder_path)

    if folder.files():

        files = {file.id : file.tags for file in folder.files()}
        for file_id, file_tags in files.items():
            if CURRENT_TAG in file_tags:
                print(file_id, file_tags)

                historic_qc_id = file_id
        
        if historic_qc_id:
            historic_qc_report = Object.retrieve(historic_qc_id).query()
            return historic_qc_report
        else: 
            return None
    else:
        return None

print(load_historic_log(folder_path))