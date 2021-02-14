using DataFrames
using CSV
using GeoStats
using Plots


# importing dataset
fe_df = DataFrame(CSV.File("datasets/Ferro.csv")) 
describe(fe_df)

# plotting georeferred dataframe
fe_georef = georef(fe_df, (:X, :Y, :Z))
plot(fe_georef, camera=(30,60))


# mean value x block size 
sp = sample(fe_georef, 50, fe_georef[:Fe], replace=false)
true_av = mean(fe_georef[:Fe])
sample_av = mean(sp[:Fe])

""""""
# 1st try(loop): not working

# block_sizes = range(1, step=5, length=10)      # this works
# means = [mean(sp, :Fe, block) for block in block_sizes] # returns an infinite loop 


# plot(xlabel="block size", ylabel="mean estimate", legend=:bottomright)
# plot!(block_sizes, means, c=:purple, label="weighted average")
# hline!([sample_av], c=:red, ls=:dash, label="sample average")
# hline!([true_av], c=:green, ls=:dash, label="true average")


""""""
# 2nd try(without loop): not working

# m15 = mean(sp, :Fe, 15.)
# m20 = mean(sp, :Fe, 20.)
# m25 = mean(sp, :Fe, 25.)
# m30 = mean(sp, :Fe, 30.)
# m35 = mean(sp, :Fe, 35.)
# m40 = mean(sp, :Fe, 40.)
# plot([10.,15.,20.,25.,30.,], [m10,m15,m20,m25,m30], c=:purple, label="weighted average")
#hline!([sample_av], c=:red, ls=:dash, label="sample average")
#hline!([true_av], c=:green, ls=:dash, label="true average")



