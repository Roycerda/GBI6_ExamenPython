
def download_pubmed(keyword):
    """para descargar la data de PubMed utilizando el ENTREZ de Biopython el parámetro de entrada para la función es el keyword """
    from Bio import Entrez
    Entrez.email = "roy10998@gmail.com" 
    handle = Entrez.esearch(db="pubmed", term="Ecuador genomics")
    record = Entrez.read(handle)
    return(record)
 

def mining_pubs(tipo):
    """esta función debe utilizar el módulo re y utilizar el párametro tipo para realizar lo siguiente:

Si el tipo es "DP" recupera el año de publicación del artículo. El retorno es un dataframe con el PMID y el DP_year.

Si el tipo es "AU" recupera el número de autores por PMID. El retorno es un dataframe con el PMID y el num_auth.

Si el tipo es "AD" recupera el conteo de autores por país. El retorno es un dataframe con el country y el num_auth."""
    
    from Bio import Entrez
    from Bio import Medline
    import re
    import pandas as pd
    handle = Entrez.esearch(db="pubmed",term="Ecuador genomics",encoding="uft8",retmode="text",retmax=192)
    record = Entrez.read(handle)
    id_list=record["IdList"]
    handel = Entrez.efetch(db="pubmed", id= id_list, rettype="medline",retmode="text")
    listas=handel.read()
    hand = Entrez.efetch(db="pubmed", id= id_list, rettype="medline", retmode="text")
    records = Medline.parse(hand)
    texto = re.sub(r'\n\s{6}', ' ', listas)
    PMID = re.findall(r"PMID\-\s(\d{8})", texto)
    DPs = re.findall(r"DP\s\s\-\s(\d{4})", texto)
    AUs=[]
    for record in records:
        au=record.get("AU", "?")
        len(au)
        AUs.append(len(au))
    AD = re.findall(r"AD\s\s\-\s.*\,\s([\sA-Za-z{2:50}]+)\.", texto)
    countries = list(set(AD))
    ADs=[]
    for cop in countries:
        pre=len(cop)
        ADs.append(pre)
        
    if tipo=="PD":
        df= pd.DataFrame({'PMID' : PMID,
                         'DP_year' : DPs})
    elif tipo=="AU":
        df= pd.DataFrame({'PMID' : PMID,
                         'num_auth' : AUs})
    elif tipo=="AD":
        df= pd.DataFrame({'PMID' : countries,
                         'num_auth' : ADs})
    return(df)
        
                   
    
   

    
  