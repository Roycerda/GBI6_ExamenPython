# pubyear
import statistics as stats
pubyear=[36,40,6,21,1,1,22,23,15,1,1,8,2,14,1]
print("media:",stats.mean(pubyear))
print("desviación estandar:",stats.pstdev(pubyear))

import numpy as np
import matplotlib.pyplot as plt
import math

def normal_distribution(x, mean, sigma):
    return np.exp(-1*((x-mean)**2)/(2*(sigma**2)))/(math.sqrt(2*np.pi) * sigma)

mean1, sigma1 = 12.8, 12.708002727940112
x1 = np.linspace(mean1 - 6*sigma1, mean1 + 6*sigma1, 191)
y1 = normal_distribution(x1, mean1, sigma1)

plt.plot(x1, y1, 'b', label='m=12.8, sig=12,7')
plt.legend(title = "Parámetros")
plt.title('Distribución Normal de conteo artículos por año')
plt.ylabel('probabilidad')
plt.xlabel('valores')
plt.grid()
plt.show()

# pub_authors

import matplotlib.pyplot as plt
import numpy as np

np.random.seed(4)

data_1 = np.random.normal(12, 0, 200)
data_2 = np.random.normal(14, 1, 200)
data_3 = np.random.normal(7, 190, 200)
data_4 = np.random.normal(1, 191, 200)
data = [data_1, data_2, data_3, data_4]

fig = plt.figure(figsize =(9, 6))

ax = fig.add_axes([0, 0, 1, 1])

bp = ax.boxplot(data)
plt.xlabel('x')
plt.ylabel('y')
plt.title('Boxplot del conteo de autores por artículo')
plt.show()

#countries

%matplotlib inline
import pandas as pd
import re
import csv
with open('data/Ecuador_genomics.txt') as f:
    my_text = f.read()
    my_text = re.sub(r'\n\s{6}', ' ', my_text)
countries = []

for ln in my_text.splitlines():
    if ln.startswith("AD  -"):
        adreess = ln[:]
        country = re.findall(r'\,\s([\sA-Za-z{2:50}]+)\.', adreess)
        countries.append(country)

import itertools
countries = list(itertools.chain.from_iterable(countries))
uniq_countries = list(set(countries))

country_coords = {}
with open('data/countryEG.txt') as f:
    csvr = csv.DictReader(f)
    for row in csvr:
        country_coords[row['Country']] = [float(row['LT']),
                                          float(row['LG'])]
paises = []
country_long = []
country_lat = []
country_count = []
for z in uniq_countries:
    if z in country_coords.keys():
        paises.append(z)
        country_lat.append(country_coords[z][0])
        country_long.append(country_coords[z][1])
        country_count.append(countries.count(z))

import numpy as np
import matplotlib.pyplot as plt
%matplotlib inline
plt.scatter(country_long, country_lat, s = country_count, c= country_count)
plt.colorbar()
plt.xlim(-130, 150)
plt.ylim(-70, 82)
ard = dict(arrowstyle="->")
plt.annotate('Panama', xy = (-80.782127, 8.537981),
               xytext = (-45, 55), arrowprops= ard)
plt.annotate('Germany', xy = (10.451526,51.165691),
               xytext = (-40, 30), arrowprops = ard)
plt.annotate('Australia', xy = (133.775136,-25.274398),
               xytext = (110, -18), arrowprops= ard)
plt.annotate('Egypt', xy = (26.820553, 30.802498),
               xytext = (1, 70), arrowprops= ard)
params = plt.gcf()
plSize = params.get_size_inches()
params.set_size_inches( (plSize[0] * 2, plSize[1] * 2) )
