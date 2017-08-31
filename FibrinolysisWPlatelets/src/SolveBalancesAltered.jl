include("MassBalances.jl")
using ODE;

# ----------------------------------------------------------------------------------- #
# Copyright (c) 2017 Varnerlab
# School of Chemical Engineering Purdue University
# W. Lafayette IN 46907 USA

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights 
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
# copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ----------------------------------------------------------------------------------- #
function SolveBalances(TSTART,TSTOP,Ts,data_dictionary,problemDict)
# ----------------------------------------------------------------------------------- #
# SolveBalances.jl was generated using the Kwatee code generation system.
# SolveBalances: Solves model equations from TSTART to TSTOP given parameters in data_dictionary.
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 08-16-2017 16:44:25
# 
# Input arguments: 
# TSTART  - Time start 
# TSTOP  - Time stop 
# Ts - Time step 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# 
# Return arguments: 
# TSIM - Simulation time vector 
# X - Simulation state array (NTIME x NSPECIES) 
# ----------------------------------------------------------------------------------- #

# Get required stuff from DataFile struct -
TSIM = collect(TSTART:Ts:TSTOP);
initial_condition_vector = data_dictionary["INITIAL_CONDITION_ARRAY"];
numComparments=8
numSpecies=22
loweridx=1
upperidx = loweridx+numSpecies-1
#set physiological initial conditions
for j in collect(1:numComparments)
	@show loweridx, upperidx,j
	initial_condition_vector[loweridx:upperidx]=problemDict["INITIAL_CONDITION_VECTOR"]
	if(j!=8)
		#if we're not in the wound, no TF
		print("Not in wound. Setting trigger to zero.\n")
		initial_condition_vector[loweridx+6]=0.0
	end
	loweridx = upperidx+1
	upperidx = loweridx+numSpecies-1
end
#@show initial_condition_vector
# Call the ODE solver - 
#fbalances(t,y,ydot) = MassBalances(t,y,ydot,data_dictionary,problemDict);
fbalances(t,y) = MassBalances(t,y,data_dictionary,problemDict);
T,X =ODE.ode23s(fbalances,initial_condition_vector,TSIM, abstol = 1E-4, reltol = 1E-6, minstep = 1E-9,maxstep = .1, points=:specified)

return (T,X);
end
