# ----------------------------------------------------------------------------------- #
# Copyright (c) 2016 Varnerlab
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
function Control(t,x,rate_vector,data_dictionary)
# ---------------------------------------------------------------------- #
# Control.jl was generated using the Kwatee code generation system.
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 05-25-2016 16:51:18
# 
# Arguments: 
# t  - current time 
# x  - state vector 
# rate_vector - vector of reaction rates 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ---------------------------------------------------------------------- #

# Set a default value for the allosteric control variables - 
EPSILON = 1.0e-3;
number_of_reactions = length(rate_vector);
control_vector = ones(number_of_reactions);
control_parameter_array = data_dictionary["CONTROL_PARAMETER_ARRAY"];

# Alias the species vector - 
# vein
FII_vein = x[1];
FIIa_vein = x[2];
PC_vein = x[3];
APC_vein = x[4];
ATIII_vein = x[5];
TM_vein = x[6];
TRIGGER_vein = x[7];

# heart
FII_heart = x[8];
FIIa_heart = x[9];
PC_heart = x[10];
APC_heart = x[11];
ATIII_heart = x[12];
TM_heart = x[13];
TRIGGER_heart = x[14];

# lungs
FII_lungs = x[15];
FIIa_lungs = x[16];
PC_lungs = x[17];
APC_lungs = x[18];
ATIII_lungs = x[19];
TM_lungs = x[20];
TRIGGER_lungs = x[21];

# artery
FII_artery = x[22];
FIIa_artery = x[23];
PC_artery = x[24];
APC_artery = x[25];
ATIII_artery = x[26];
TM_artery = x[27];
TRIGGER_artery = x[28];

# kidney
FII_kidney = x[29];
FIIa_kidney = x[30];
PC_kidney = x[31];
APC_kidney = x[32];
ATIII_kidney = x[33];
TM_kidney = x[34];
TRIGGER_kidney = x[35];

# liver
FII_liver = x[36];
FIIa_liver = x[37];
PC_liver = x[38];
APC_liver = x[39];
ATIII_liver = x[40];
TM_liver = x[41];
TRIGGER_liver = x[42];

# bulk
FII_bulk = x[43];
FIIa_bulk = x[44];
PC_bulk = x[45];
APC_bulk = x[46];
ATIII_bulk = x[47];
TM_bulk = x[48];
TRIGGER_bulk = x[49];

# wound
FII_wound = x[50];
FIIa_wound = x[51];
PC_wound = x[52];
APC_wound = x[53];
ATIII_wound = x[54];
TM_wound = x[55];
TRIGGER_wound = x[56];
volume_vein = x[57];
volume_heart = x[58];
volume_lungs = x[59];
volume_artery = x[60];
volume_kidney = x[61];
volume_liver = x[62];
volume_bulk = x[63];
volume_wound = x[64];

# Modify the rate_vector with the control variables - 
rate_vector = rate_vector.*control_vector;

# Return the modified rate vector - 
return rate_vector;
end
