use "/Users/MALF/Dropbox/EASP/RepSciEpi/GitHub_DeltaMethod/data.dta"
logistic Y age cmbd
logistic Y age cmbd, coeflegend
nlcom  (1 + exp(- _b[_cons]-_b[age]*75- _b[cmbd]*1))/(1 + exp(- _b[_cons]-_b[age]*45- _b[cmbd]*0))
