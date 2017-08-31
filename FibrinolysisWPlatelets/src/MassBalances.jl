include("Kinetics.jl");
include("Control.jl");
include("Flow.jl");
include("Dilution.jl");
include("BalanceEquations.jl")

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
#function MassBalances(t,x,dxdt_vector,data_dictionary,ProblemDict)
function MassBalances(t,x,data_dictionary,AllProblemDict)
# ---------------------------------------------------------------------- #
# MassBalances.jl was generated using the Kwatee code generation system.
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 08-16-2017 16:44:25
# 
# Arguments: 
# t  - current time 
# x  - state vector 
# dxdt_vector - right hand side vector 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ---------------------------------------------------------------------- #
@show t
# Get data from the data_dictionary - 
S = data_dictionary["STOICHIOMETRIC_MATRIX"];
C = data_dictionary["FLOW_CONNECTIVITY_MATRIX"];
tau_array=data_dictionary["TIME_CONSTANT_ARRAY"];
dxdt_vector = zeros(size(x))

# Correct nagative x's = throws errors in control even if small - 
idx = find(x->(x<0),x);
x[idx] = 0.0;

#remove trigger at 4 min
#if(t>4)
#	x[161]=0.0
#end

# Call the kinetics function - 
numComparments=8
numSpecies=22
loweridx = 1
upperidx = loweridx+numSpecies-1
rate_vector = zeros(size(S,1))

for j in collect(1:numComparments)
	#@show loweridx, upperidx,j
	ProblemDict=AllProblemDict[j]
	rate_vector[loweridx:upperidx]=BalanceEquations(t,x[loweridx:upperidx], ProblemDict)
	loweridx = upperidx+1
	upperidx = upperidx+numSpecies
end
#(rate_vector) = Kinetics(t,x,data_dictionary);

# Call the control function - 
(rate_vector) = Control(t,x,rate_vector,data_dictionary);

# Call the flow function - 
(flow_terms_vector,q_vector) = Flow(t,x,data_dictionary);
#@show q_vector

# Call the dilution function - 
tmp_dvdt_vector = C*q_vector;
#@show tmp_dvdt_vector
(dilution_terms_vector) = Dilution(t,x,tmp_dvdt_vector,data_dictionary);
# Encode the biochemical balance equations as a matrix vector product - 
tmp_vector = flow_terms_vector + S*rate_vector - dilution_terms_vector;
number_of_states = length(tmp_vector);
for state_index in collect(1:number_of_states)
	dxdt_vector[state_index] = tau_array[state_index]*tmp_vector[state_index];
end

# Return the volume dvdt terms - 
number_of_compartments = length(tmp_dvdt_vector);
for compartment_index in collect(1:number_of_compartments)
	state_vector_index = (number_of_states)+compartment_index;
	dxdt_vector[state_vector_index] = tmp_dvdt_vector[compartment_index];
end
	#@show dxdt_vector
	return dxdt_vector
end
