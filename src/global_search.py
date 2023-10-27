import solvebio

solvebio.login()


from solvebio import GlobalSearch


# Advanced search (using keyword argument)
# study_id = "D361DC00001"
# study_id = "D798AC00001"
# study_id = "D9075C00001"
# dx = False

# if dx == True:
#     search = GlobalSearch(query=f'type:vault AND study:{study_id} AND tags:dx')

# else:
#     search = GlobalSearch(query=f'type:vault AND study:{study_id} AND NOT tags:dx')


# if search:
#     existing_vault = list(search)[0]['vault']
#     print(f'ERROR: Can not create vault with {study_id}. '
#                         f'It already exists with the name: {existing_vault}')
#     raise Exception(f'Vault already exists: {existing_vault}')


dcode_studies_list = dict()

dcode_studies = solvebio.Vault.all()
for study_vault in dcode_studies:
    if "dx" not in study_vault.tags:
        print(study_vault.name)

