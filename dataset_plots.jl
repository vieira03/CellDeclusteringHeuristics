using DataFrames
using CSV
using GeoStats
using Plots


fe_df = DataFrame(CSV.File("datasets/Ferro.csv")) 


fe_georef = georef(fe_df, (:X, :Y, :Z))

plot(fe_georef, camera=(30,60))


# mean value x block size (enormous RAM usage)
sp = sample(fe_georef, 50, fe_georef[:Fe], replace=false)
true_av = mean(fe_georef[:Fe])
sample_av = mean(sp[:Fe])


