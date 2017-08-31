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
function Kinetics(t,x,data_dictionary)
# --------------------------------------------------------------------- #
# Kinetics.jl was generated using the Kwatee code generation system.
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 08-18-2017 09:16:23
# 
# Input arguments: 
# t  - current time 
# x  - state vector 
# data_dictionary - parameter vector 
# 
# Return arguments: 
# rate_vector - rate vector 
# --------------------------------------------------------------------- #
# 
# Alias the species vector - 
# vein
FII_vein = x[1];
FIIa_vein = x[2];
PC_vein = x[3];
APC_vein = x[4];
ATIII_vein = x[5];
TM_vein = x[6];
TRIGGER_vein = x[7];
Eps_vein = x[8];
FV_FX_vein = x[9];
FV_FXa_vein = x[10];
PROTHOMBINASE_PLATELETS_vein = x[11];
Fibrin_vein = x[12];
Plasmin_vein = x[13];
Fibrinogen_vein = x[14];
Plasminogen_vein = x[15];
tPA_vein = x[16];
uPA_vein = x[17];
Fibrin_monomer_vein = x[18];
Protofibril_vein = x[19];
antiplasmin_vein = x[20];
PAI_1_vein = x[21];
Fiber_vein = x[22];

# heart
FII_heart = x[23];
FIIa_heart = x[24];
PC_heart = x[25];
APC_heart = x[26];
ATIII_heart = x[27];
TM_heart = x[28];
TRIGGER_heart = x[29];
Eps_heart = x[30];
FV_FX_heart = x[31];
FV_FXa_heart = x[32];
PROTHOMBINASE_PLATELETS_heart = x[33];
Fibrin_heart = x[34];
Plasmin_heart = x[35];
Fibrinogen_heart = x[36];
Plasminogen_heart = x[37];
tPA_heart = x[38];
uPA_heart = x[39];
Fibrin_monomer_heart = x[40];
Protofibril_heart = x[41];
antiplasmin_heart = x[42];
PAI_1_heart = x[43];
Fiber_heart = x[44];

# lungs
FII_lungs = x[45];
FIIa_lungs = x[46];
PC_lungs = x[47];
APC_lungs = x[48];
ATIII_lungs = x[49];
TM_lungs = x[50];
TRIGGER_lungs = x[51];
Eps_lungs = x[52];
FV_FX_lungs = x[53];
FV_FXa_lungs = x[54];
PROTHOMBINASE_PLATELETS_lungs = x[55];
Fibrin_lungs = x[56];
Plasmin_lungs = x[57];
Fibrinogen_lungs = x[58];
Plasminogen_lungs = x[59];
tPA_lungs = x[60];
uPA_lungs = x[61];
Fibrin_monomer_lungs = x[62];
Protofibril_lungs = x[63];
antiplasmin_lungs = x[64];
PAI_1_lungs = x[65];
Fiber_lungs = x[66];

# artery
FII_artery = x[67];
FIIa_artery = x[68];
PC_artery = x[69];
APC_artery = x[70];
ATIII_artery = x[71];
TM_artery = x[72];
TRIGGER_artery = x[73];
Eps_artery = x[74];
FV_FX_artery = x[75];
FV_FXa_artery = x[76];
PROTHOMBINASE_PLATELETS_artery = x[77];
Fibrin_artery = x[78];
Plasmin_artery = x[79];
Fibrinogen_artery = x[80];
Plasminogen_artery = x[81];
tPA_artery = x[82];
uPA_artery = x[83];
Fibrin_monomer_artery = x[84];
Protofibril_artery = x[85];
antiplasmin_artery = x[86];
PAI_1_artery = x[87];
Fiber_artery = x[88];

# kidney
FII_kidney = x[89];
FIIa_kidney = x[90];
PC_kidney = x[91];
APC_kidney = x[92];
ATIII_kidney = x[93];
TM_kidney = x[94];
TRIGGER_kidney = x[95];
Eps_kidney = x[96];
FV_FX_kidney = x[97];
FV_FXa_kidney = x[98];
PROTHOMBINASE_PLATELETS_kidney = x[99];
Fibrin_kidney = x[100];
Plasmin_kidney = x[101];
Fibrinogen_kidney = x[102];
Plasminogen_kidney = x[103];
tPA_kidney = x[104];
uPA_kidney = x[105];
Fibrin_monomer_kidney = x[106];
Protofibril_kidney = x[107];
antiplasmin_kidney = x[108];
PAI_1_kidney = x[109];
Fiber_kidney = x[110];

# liver
FII_liver = x[111];
FIIa_liver = x[112];
PC_liver = x[113];
APC_liver = x[114];
ATIII_liver = x[115];
TM_liver = x[116];
TRIGGER_liver = x[117];
Eps_liver = x[118];
FV_FX_liver = x[119];
FV_FXa_liver = x[120];
PROTHOMBINASE_PLATELETS_liver = x[121];
Fibrin_liver = x[122];
Plasmin_liver = x[123];
Fibrinogen_liver = x[124];
Plasminogen_liver = x[125];
tPA_liver = x[126];
uPA_liver = x[127];
Fibrin_monomer_liver = x[128];
Protofibril_liver = x[129];
antiplasmin_liver = x[130];
PAI_1_liver = x[131];
Fiber_liver = x[132];

# bulk
FII_bulk = x[133];
FIIa_bulk = x[134];
PC_bulk = x[135];
APC_bulk = x[136];
ATIII_bulk = x[137];
TM_bulk = x[138];
TRIGGER_bulk = x[139];
Eps_bulk = x[140];
FV_FX_bulk = x[141];
FV_FXa_bulk = x[142];
PROTHOMBINASE_PLATELETS_bulk = x[143];
Fibrin_bulk = x[144];
Plasmin_bulk = x[145];
Fibrinogen_bulk = x[146];
Plasminogen_bulk = x[147];
tPA_bulk = x[148];
uPA_bulk = x[149];
Fibrin_monomer_bulk = x[150];
Protofibril_bulk = x[151];
antiplasmin_bulk = x[152];
PAI_1_bulk = x[153];
Fiber_bulk = x[154];

# wound
FII_wound = x[155];
FIIa_wound = x[156];
PC_wound = x[157];
APC_wound = x[158];
ATIII_wound = x[159];
TM_wound = x[160];
TRIGGER_wound = x[161];
Eps_wound = x[162];
FV_FX_wound = x[163];
FV_FXa_wound = x[164];
PROTHOMBINASE_PLATELETS_wound = x[165];
Fibrin_wound = x[166];
Plasmin_wound = x[167];
Fibrinogen_wound = x[168];
Plasminogen_wound = x[169];
tPA_wound = x[170];
uPA_wound = x[171];
Fibrin_monomer_wound = x[172];
Protofibril_wound = x[173];
antiplasmin_wound = x[174];
PAI_1_wound = x[175];
Fiber_wound = x[176];

volume_vein = x[177];
volume_heart = x[178];
volume_lungs = x[179];
volume_artery = x[180];
volume_kidney = x[181];
volume_liver = x[182];
volume_bulk = x[183];
volume_wound = x[184];

# Characteristic variables - 
characteristic_variable_array = data_dictionary["CHARACTERISTIC_VARIABLE_ARRAY"];
characteristic_concentration = characteristic_variable_array[2];
characteristic_time = characteristic_variable_array[4];

# Formulate the kinetic rate vector - 
rate_constant_array = data_dictionary["RATE_CONSTANT_ARRAY"];
saturation_constant_array = data_dictionary["SATURATION_CONSTANT_ARRAY"];
rate_vector = Float64[];

# -------------------------------------------------------------------------- # 
# vein
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[1];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[2];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[3];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[4];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[5];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[6];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[7];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[8];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[9];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[10];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[11];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[12];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[13];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[14];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[15];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[16];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[17];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[18];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[19];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[20];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[21];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[22];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# heart
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[23];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[24];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[25];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[26];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[27];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[28];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[29];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[30];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[31];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[32];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[33];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[34];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[35];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[36];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[37];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[38];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[39];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[40];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[41];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[42];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[43];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[44];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# lungs
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[45];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[46];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[47];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[48];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[49];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[50];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[51];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[52];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[53];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[54];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[55];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[56];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[57];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[58];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[59];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[60];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[61];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[62];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[63];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[64];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[65];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[66];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# artery
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[67];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[68];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[69];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[70];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[71];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[72];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[73];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[74];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[75];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[76];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[77];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[78];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[79];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[80];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[81];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[82];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[83];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[84];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[85];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[86];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[87];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[88];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# kidney
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[89];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[90];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[91];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[92];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[93];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[94];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[95];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[96];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[97];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[98];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[99];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[100];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[101];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[102];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[103];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[104];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[105];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[106];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[107];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[108];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[109];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[110];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# liver
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[111];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[112];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[113];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[114];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[115];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[116];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[117];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[118];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[119];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[120];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[121];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[122];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[123];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[124];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[125];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[126];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[127];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[128];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[129];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[130];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[131];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[132];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# bulk
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[133];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[134];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[135];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[136];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[137];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[138];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[139];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[140];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[141];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[142];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[143];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[144];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[145];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[146];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[147];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[148];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[149];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[150];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[151];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[152];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[153];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[154];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# -------------------------------------------------------------------------- # 
# wound
# -------------------------------------------------------------------------- # 
# reaction1: compartment: * [] -([])-> FII
tmp_reaction = rate_constant_array[155];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction2: compartment: * [] -([])-> FIIa
tmp_reaction = rate_constant_array[156];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction3: compartment: * [] -([])-> PC
tmp_reaction = rate_constant_array[157];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction4: compartment: * [] -([])-> APC
tmp_reaction = rate_constant_array[158];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction5: compartment: * [] -([])-> ATIII
tmp_reaction = rate_constant_array[159];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction6: compartment: * [] -([])-> TM
tmp_reaction = rate_constant_array[160];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction7: compartment: * [] -([])-> TRIGGER
tmp_reaction = rate_constant_array[161];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction8: compartment: * [] -([])-> Eps
tmp_reaction = rate_constant_array[162];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction9: compartment: * [] -([])-> FV_FX
tmp_reaction = rate_constant_array[163];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction10: compartment: * [] -([])-> FV_FXa
tmp_reaction = rate_constant_array[164];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
tmp_reaction = rate_constant_array[165];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction12: compartment: * [] -([])-> Fibrin
tmp_reaction = rate_constant_array[166];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction13: compartment: * [] -([])-> Plasmin
tmp_reaction = rate_constant_array[167];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction14: compartment: * [] -([])-> Fibrinogen
tmp_reaction = rate_constant_array[168];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction15: compartment: * [] -([])-> Plasminogen
tmp_reaction = rate_constant_array[169];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction16: compartment: * [] -([])-> tPA
tmp_reaction = rate_constant_array[170];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction17: compartment: * [] -([])-> uPA
tmp_reaction = rate_constant_array[171];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction18: compartment: * [] -([])-> Fibrin_monomer
tmp_reaction = rate_constant_array[172];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction19: compartment: * [] -([])-> Protofibril
tmp_reaction = rate_constant_array[173];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction20: compartment: * [] -([])-> antiplasmin
tmp_reaction = rate_constant_array[174];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction21: compartment: * [] -([])-> PAI_1
tmp_reaction = rate_constant_array[175];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# reaction22: compartment: * [] -([])-> Fiber
tmp_reaction = rate_constant_array[176];
push!(rate_vector,tmp_reaction);
tmp_reaction = 0;

# return the kinetics vector -
return rate_vector;
end
