import solvebio
from solvebio import Dataset

IMPORT_IA_MAPPINGS_DATASET_ID = "1771747904420692973"
dataset = solvebio.Dataset.retrieve(IMPORT_IA_MAPPINGS_DATASET_ID)
records = [
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'key': 'SUBJECT',
        'value': 'SUBJID',
    },
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'key': 'STUDY',
        'value': 'STUDY_ID',
    },
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'key': 'BLOCKID',
        'value': 'BLOCK_ID',
    },
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'key': 'SECDT',
        'value': 'SECDAT',
    },
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'key': 'INDICAT',
        'value': 'INDIC',
    },
    {
        'domain': 'Hematogenix_SP263_pathologist',
        'prefix': '',
        'key': 'RTPRPOS',
        'value': '',
        'readout': 'RTPRPOS',
        'essential': '',
        'description': 'Raw PD-L1 Positive TC (% relative to TA)',
        'target': 'PDL1',
        'region': '',
        'type': '',
        'unit': '%',
        'assay': 'PDL1',
        'readout_type': 'numerical',
        'regex': '''["re.sub('<1.*','0.5',str(x))"]'''
    }
]
solvebio.DatasetImport.create(
    dataset_id=dataset.id,
    data_records=records
)