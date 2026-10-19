from rdkit import Chem
from rdkit.Chem import Descriptors

def canonicalize(smiles: str) -> str:
    mol = Chem.MolFromSmiles(smiles)
    if mol is None:
        raise ValueError(f"Invalid SMILES: {smiles}")
    return Chem.MolToSmiles(mol)

def mw(smiles: str) -> float:
    mol = Chem.MolFromSmiles(smiles)
    return Descriptors.MolWt(mol)

def formula(smiles: str) -> str:
    mol = Chem.MolFromSmiles(smiles)
    return Chem.rdMolDescriptors.CalcMolFormula(mol)
