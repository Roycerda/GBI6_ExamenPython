record=msc.download_pubmed(keyword="Ecuador genomics")

print("número de artículos es: ", record["Count"] )
print("PMID del primer artículo es: ", record["IdList"][0] )
##
