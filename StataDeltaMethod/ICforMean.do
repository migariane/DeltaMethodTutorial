// M-estimator for the sample mean
clear
set seed 123
set obs 1000
gen x=rnormal(0,1)
mean x

// First derivative mean = constant = 1

// Applying functional delta method

// Influence curve for the mean
qui: sum x
gen double ic = 1 * (x - r(mean))
gen double ex = x + ic // Pluging estimator mean

tab ic
sum ic
// Geometry of the IC (loss function)
tw(line x ic)
tw(line ic x)
tw(kdensity ic)(kdensity x)

// Asymptotic linear inference
qui: sum ic, det

gen double lci = ex - (invnormal(0.975) * sqrt(`r(Var)'  / 1000))
gen double uci = ex + (invnormal(0.975) * sqrt(`r(Var)' / 1000))

mean x
mean ex lci uci

// Stata Delta method
regres x
nlcom _b[_cons]
mean ex lci uci

