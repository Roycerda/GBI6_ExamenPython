print(" pub_year")
df=msc.mining_pubs(tipo="PD")
print(pd.concat([df.iloc[:2],df.iloc[190:]]))
print(" pub_authors")
df=msc.mining_pubs(tipo="AU")
print(pd.concat([df.iloc[:2],df.iloc[190:]]))
print(" coutries")
df=msc.mining_pubs(tipo="AD")
print(pd.concat([df.iloc[:2],df.iloc[190:]]))
