using DataFrames
using CSV
using GeoStats
using Plots


# importing dataset
fe_df = DataFrame(CSV.File("datasets/Ferro.csv")) 
describe(fe_df)

# plotting georeferred dataframe
fe_georef = georef(fe_df, (:X, :Y, :Z))
plot(fe_georef)


# mean value x block size 
sp = sample(fe_georef, 500, fe_georef[:Fe], replace=false)
true_av = mean(fe_georef[:Fe])
sample_av = mean(sp[:Fe])


block_sizes = range(20, stop=120, length=100)     
means = [mean(sp, :Fe, block) for block in block_sizes] 


plot(xlabel="block size", ylabel="mean estimate", legend=:bottomright)
plot!(block_sizes, means, c=:purple, label="weighted average")
hline!([sample_av], c=:red, ls=:dash, label="sample average")
hline!([true_av], c=:green, ls=:dash, label="true average")




