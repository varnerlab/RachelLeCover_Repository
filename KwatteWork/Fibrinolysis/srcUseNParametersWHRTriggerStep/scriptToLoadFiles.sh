#!/bin/bash 
julia -p 8 -L Balances.jl -L CardiacDistribution.jl -L Control.jl -L DataFile.jl -L Dilution.jl -L Flow.jl -L generateData.jl -L HeartRate.jl -L Kinetics.jl -L MassBalances.jl -L runAllPatients.jl -L runModel.jl -L runPatient.jl -L SolveBalances.jl
