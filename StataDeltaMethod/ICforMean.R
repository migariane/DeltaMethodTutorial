# M-estimation for the sample mean
set.seed(7777)
n <- 1000
x <- runif(n,0,1)
mx = mean(x)

# Functional delta method: influence curve for the mean (first derivative sample mean = 1 (constatn))
IC = 1 * (x - mx)
# M-estimation of the sample mean
Yhat <- x + IC # Pluging estimator
Yhat <- mean(Yhat); Yhat

# Geometry of the IC
plot(x, IC)
# hist(IC)
varYhat.IC <- var(IC)/n;
seIC <- sqrt(varYhat.IC)

# Asymptotic linear inferece 95% Confidence Inntervals
Yhat_CI <- c(mean(Yhat) - 1.96*sqrt(varYhat.IC), mean(Yhat) + 1.96*sqrt(varYhat.IC)); mean(Yhat); Yhat_CI

# Check with implemented Delta Method in library MSM
library(msm)
se = deltamethod(g= ~x1, mean= mx, cov= varYhat.IC)
print(se)
seIC

# Check 95%CI delta method by hand, delta method RcmdrMisc 
Yhat_CI <- c(mean(Yhat) - 1.96*sqrt(varYhat.IC), mean(Yhat) + 1.96*sqrt(varYhat.IC)); mean(Yhat); Yhat_CI
library(RcmdrMisc)
DeltaMethod(lm(x ~ 1), "b0")


