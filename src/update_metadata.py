from solvebio import Vault
import solvebio

solvebio.login()
# Upload a file or retrieve one
vault = Vault.get_personal_vault()
csv_file = vault.upload_file('data/summary_report.csv', '/')

# Add metadata to the object
csv_file.metadata = {'dx':True}
csv_file.save()