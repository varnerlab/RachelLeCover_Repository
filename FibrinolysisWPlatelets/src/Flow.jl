include("HeartRate.jl");
include("CardiacDistribution.jl");
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
function Flow(t,x,data_dictionary)
# ---------------------------------------------------------------------- #
# Flow.jl was generated using the Kwatee code generation system.
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 08-18-2017 09:16:23
# 
# Arguments: 
# t  - current time 
# x  - state vector 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ---------------------------------------------------------------------- #

# Characteristic variables - 
characteristic_variable_array = data_dictionary["CHARACTERISTIC_VARIABLE_ARRAY"];
characteristic_flow_rate = characteristic_variable_array[3];

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

# Alias the species input vector - 
input_concentration_array = data_dictionary["INPUT_CONCENTRATION_ARRAY"]

# Get data we need from the data_dictionary - 
default_bpm = data_dictionary["DEFAULT_BEATS_PER_MINUTE"];
default_stroke_volume = data_dictionary["DEFAULT_STROKE_VOLUME"];
default_flow_parameter_array = data_dictionary["FLOW_PARAMETER_ARRAY"];

# Update the heart rate, and stroke volume - 
(bpm,stroke_volume) = HeartRate(t,x,default_bpm,default_stroke_volume,data_dictionary);

# Update the fraction of cardiac output going to each organ - 
(flow_parameter_array) = CardiacDistribution(t,x,default_flow_parameter_array,data_dictionary);

# Calculate the q_vector - 
q_vector = Float64[];
cardiac_output = (1.0/characteristic_flow_rate)*bpm*stroke_volume;

# 1 vein_to_heart
tmp_flow_rate = cardiac_output*flow_parameter_array[1];
push!(q_vector,tmp_flow_rate);

# 2 heart_to_lungs
tmp_flow_rate = cardiac_output*flow_parameter_array[2];
push!(q_vector,tmp_flow_rate);

# 3 lungs_to_heart
tmp_flow_rate = cardiac_output*flow_parameter_array[3];
push!(q_vector,tmp_flow_rate);

# 4 heart_to_artery
tmp_flow_rate = cardiac_output*flow_parameter_array[4];
push!(q_vector,tmp_flow_rate);

# 5 artery_to_kidney
tmp_flow_rate = cardiac_output*flow_parameter_array[5];
push!(q_vector,tmp_flow_rate);

# 6 kidney_to_vein
tmp_flow_rate = cardiac_output*flow_parameter_array[6];
push!(q_vector,tmp_flow_rate);

# 7 artery_to_liver
tmp_flow_rate = cardiac_output*flow_parameter_array[7];
push!(q_vector,tmp_flow_rate);

# 8 liver_to_vein
tmp_flow_rate = cardiac_output*flow_parameter_array[8];
push!(q_vector,tmp_flow_rate);

# 9 artery_to_bulk
tmp_flow_rate = cardiac_output*flow_parameter_array[9];
push!(q_vector,tmp_flow_rate);

# 10 bulk_to_vein
tmp_flow_rate = cardiac_output*flow_parameter_array[10];
push!(q_vector,tmp_flow_rate);

# 11 artery_to_wound
tmp_flow_rate = cardiac_output*flow_parameter_array[11];
push!(q_vector,tmp_flow_rate);

# 12 artery_to_wound_reverse
tmp_flow_rate = cardiac_output*flow_parameter_array[12];
push!(q_vector,tmp_flow_rate);

# 13 wound_to_degredation
tmp_flow_rate = cardiac_output*flow_parameter_array[13];
push!(q_vector,tmp_flow_rate);

# Calculate the species_flow_terms - 
species_flow_vector = Float64[];

# FII_vein ---------- 
tmp_flow_term = -(q_vector[1])*FII_vein+(q_vector[6]*FII_kidney+q_vector[8]*FII_liver+q_vector[10]*FII_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_vein ---------- 
tmp_flow_term = -(q_vector[1])*FIIa_vein+(q_vector[6]*FIIa_kidney+q_vector[8]*FIIa_liver+q_vector[10]*FIIa_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# PC_vein ---------- 
tmp_flow_term = -(q_vector[1])*PC_vein+(q_vector[6]*PC_kidney+q_vector[8]*PC_liver+q_vector[10]*PC_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# APC_vein ---------- 
tmp_flow_term = -(q_vector[1])*APC_vein+(q_vector[6]*APC_kidney+q_vector[8]*APC_liver+q_vector[10]*APC_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_vein ---------- 
tmp_flow_term = -(q_vector[1])*ATIII_vein+(q_vector[6]*ATIII_kidney+q_vector[8]*ATIII_liver+q_vector[10]*ATIII_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# TM_vein ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_vein ---------- 
push!(species_flow_vector,0.0);

# Eps_vein ---------- 
tmp_flow_term = -(q_vector[1])*Eps_vein+(q_vector[6]*Eps_kidney+q_vector[8]*Eps_liver+q_vector[10]*Eps_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_vein ---------- 
tmp_flow_term = -(q_vector[1])*FV_FX_vein+(q_vector[6]*FV_FX_kidney+q_vector[8]*FV_FX_liver+q_vector[10]*FV_FX_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_vein ---------- 
tmp_flow_term = -(q_vector[1])*FV_FXa_vein+(q_vector[6]*FV_FXa_kidney+q_vector[8]*FV_FXa_liver+q_vector[10]*FV_FXa_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_vein ---------- 
tmp_flow_term = -(q_vector[1])*PROTHOMBINASE_PLATELETS_vein+(q_vector[6]*PROTHOMBINASE_PLATELETS_kidney+q_vector[8]*PROTHOMBINASE_PLATELETS_liver+q_vector[10]*PROTHOMBINASE_PLATELETS_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_vein ---------- 
push!(species_flow_vector,0.0);

# Plasmin_vein ---------- 
tmp_flow_term = -(q_vector[1])*Plasmin_vein+(q_vector[6]*Plasmin_kidney+q_vector[8]*Plasmin_liver+q_vector[10]*Plasmin_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_vein ---------- 
tmp_flow_term = -(q_vector[1])*Fibrinogen_vein+(q_vector[6]*Fibrinogen_kidney+q_vector[8]*Fibrinogen_liver+q_vector[10]*Fibrinogen_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_vein ---------- 
tmp_flow_term = -(q_vector[1])*Plasminogen_vein+(q_vector[6]*Plasminogen_kidney+q_vector[8]*Plasminogen_liver+q_vector[10]*Plasminogen_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_vein ---------- 
tmp_flow_term = -(q_vector[1])*tPA_vein+(q_vector[6]*tPA_kidney+q_vector[8]*tPA_liver+q_vector[10]*tPA_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_vein ---------- 
tmp_flow_term = -(q_vector[1])*uPA_vein+(q_vector[6]*uPA_kidney+q_vector[8]*uPA_liver+q_vector[10]*uPA_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_vein ---------- 
tmp_flow_term = -(q_vector[1])*Fibrin_monomer_vein+(q_vector[6]*Fibrin_monomer_kidney+q_vector[8]*Fibrin_monomer_liver+q_vector[10]*Fibrin_monomer_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_vein ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_vein ---------- 
tmp_flow_term = -(q_vector[1])*antiplasmin_vein+(q_vector[6]*antiplasmin_kidney+q_vector[8]*antiplasmin_liver+q_vector[10]*antiplasmin_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_vein ---------- 
tmp_flow_term = -(q_vector[1])*PAI_1_vein+(q_vector[6]*PAI_1_kidney+q_vector[8]*PAI_1_liver+q_vector[10]*PAI_1_bulk);
push!(species_flow_vector,(1.0/volume_vein)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_vein ---------- 
push!(species_flow_vector,0.0);

# FII_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*FII_heart+(q_vector[1]*FII_vein+q_vector[3]*FII_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*FIIa_heart+(q_vector[1]*FIIa_vein+q_vector[3]*FIIa_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# PC_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*PC_heart+(q_vector[1]*PC_vein+q_vector[3]*PC_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# APC_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*APC_heart+(q_vector[1]*APC_vein+q_vector[3]*APC_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*ATIII_heart+(q_vector[1]*ATIII_vein+q_vector[3]*ATIII_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# TM_heart ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_heart ---------- 
push!(species_flow_vector,0.0);

# Eps_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*Eps_heart+(q_vector[1]*Eps_vein+q_vector[3]*Eps_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*FV_FX_heart+(q_vector[1]*FV_FX_vein+q_vector[3]*FV_FX_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*FV_FXa_heart+(q_vector[1]*FV_FXa_vein+q_vector[3]*FV_FXa_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*PROTHOMBINASE_PLATELETS_heart+(q_vector[1]*PROTHOMBINASE_PLATELETS_vein+q_vector[3]*PROTHOMBINASE_PLATELETS_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_heart ---------- 
push!(species_flow_vector,0.0);

# Plasmin_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*Plasmin_heart+(q_vector[1]*Plasmin_vein+q_vector[3]*Plasmin_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*Fibrinogen_heart+(q_vector[1]*Fibrinogen_vein+q_vector[3]*Fibrinogen_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*Plasminogen_heart+(q_vector[1]*Plasminogen_vein+q_vector[3]*Plasminogen_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*tPA_heart+(q_vector[1]*tPA_vein+q_vector[3]*tPA_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*uPA_heart+(q_vector[1]*uPA_vein+q_vector[3]*uPA_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*Fibrin_monomer_heart+(q_vector[1]*Fibrin_monomer_vein+q_vector[3]*Fibrin_monomer_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_heart ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*antiplasmin_heart+(q_vector[1]*antiplasmin_vein+q_vector[3]*antiplasmin_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_heart ---------- 
tmp_flow_term = -(q_vector[2]+q_vector[4])*PAI_1_heart+(q_vector[1]*PAI_1_vein+q_vector[3]*PAI_1_lungs);
push!(species_flow_vector,(1.0/volume_heart)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_heart ---------- 
push!(species_flow_vector,0.0);

# FII_lungs ---------- 
tmp_flow_term = -(q_vector[3])*FII_lungs+(q_vector[2]*FII_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_lungs ---------- 
tmp_flow_term = -(q_vector[3])*FIIa_lungs+(q_vector[2]*FIIa_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# PC_lungs ---------- 
tmp_flow_term = -(q_vector[3])*PC_lungs+(q_vector[2]*PC_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# APC_lungs ---------- 
tmp_flow_term = -(q_vector[3])*APC_lungs+(q_vector[2]*APC_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_lungs ---------- 
tmp_flow_term = -(q_vector[3])*ATIII_lungs+(q_vector[2]*ATIII_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# TM_lungs ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_lungs ---------- 
push!(species_flow_vector,0.0);

# Eps_lungs ---------- 
tmp_flow_term = -(q_vector[3])*Eps_lungs+(q_vector[2]*Eps_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_lungs ---------- 
tmp_flow_term = -(q_vector[3])*FV_FX_lungs+(q_vector[2]*FV_FX_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_lungs ---------- 
tmp_flow_term = -(q_vector[3])*FV_FXa_lungs+(q_vector[2]*FV_FXa_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_lungs ---------- 
tmp_flow_term = -(q_vector[3])*PROTHOMBINASE_PLATELETS_lungs+(q_vector[2]*PROTHOMBINASE_PLATELETS_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_lungs ---------- 
push!(species_flow_vector,0.0);

# Plasmin_lungs ---------- 
tmp_flow_term = -(q_vector[3])*Plasmin_lungs+(q_vector[2]*Plasmin_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_lungs ---------- 
tmp_flow_term = -(q_vector[3])*Fibrinogen_lungs+(q_vector[2]*Fibrinogen_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_lungs ---------- 
tmp_flow_term = -(q_vector[3])*Plasminogen_lungs+(q_vector[2]*Plasminogen_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_lungs ---------- 
tmp_flow_term = -(q_vector[3])*tPA_lungs+(q_vector[2]*tPA_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_lungs ---------- 
tmp_flow_term = -(q_vector[3])*uPA_lungs+(q_vector[2]*uPA_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_lungs ---------- 
tmp_flow_term = -(q_vector[3])*Fibrin_monomer_lungs+(q_vector[2]*Fibrin_monomer_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_lungs ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_lungs ---------- 
tmp_flow_term = -(q_vector[3])*antiplasmin_lungs+(q_vector[2]*antiplasmin_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_lungs ---------- 
tmp_flow_term = -(q_vector[3])*PAI_1_lungs+(q_vector[2]*PAI_1_heart);
push!(species_flow_vector,(1.0/volume_lungs)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_lungs ---------- 
push!(species_flow_vector,0.0);

# FII_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*FII_artery+(q_vector[4]*FII_heart+q_vector[12]*FII_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*FIIa_artery+(q_vector[4]*FIIa_heart+q_vector[12]*FIIa_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# PC_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*PC_artery+(q_vector[4]*PC_heart+q_vector[12]*PC_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# APC_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*APC_artery+(q_vector[4]*APC_heart+q_vector[12]*APC_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*ATIII_artery+(q_vector[4]*ATIII_heart+q_vector[12]*ATIII_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# TM_artery ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_artery ---------- 
push!(species_flow_vector,0.0);

# Eps_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*Eps_artery+(q_vector[4]*Eps_heart+q_vector[12]*Eps_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*FV_FX_artery+(q_vector[4]*FV_FX_heart+q_vector[12]*FV_FX_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*FV_FXa_artery+(q_vector[4]*FV_FXa_heart+q_vector[12]*FV_FXa_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*PROTHOMBINASE_PLATELETS_artery+(q_vector[4]*PROTHOMBINASE_PLATELETS_heart+q_vector[12]*PROTHOMBINASE_PLATELETS_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_artery ---------- 
push!(species_flow_vector,0.0);

# Plasmin_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*Plasmin_artery+(q_vector[4]*Plasmin_heart+q_vector[12]*Plasmin_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*Fibrinogen_artery+(q_vector[4]*Fibrinogen_heart+q_vector[12]*Fibrinogen_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*Plasminogen_artery+(q_vector[4]*Plasminogen_heart+q_vector[12]*Plasminogen_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*tPA_artery+(q_vector[4]*tPA_heart+q_vector[12]*tPA_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*uPA_artery+(q_vector[4]*uPA_heart+q_vector[12]*uPA_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*Fibrin_monomer_artery+(q_vector[4]*Fibrin_monomer_heart+q_vector[12]*Fibrin_monomer_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_artery ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*antiplasmin_artery+(q_vector[4]*antiplasmin_heart+q_vector[12]*antiplasmin_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_artery ---------- 
tmp_flow_term = -(q_vector[5]+q_vector[7]+q_vector[9]+q_vector[11])*PAI_1_artery+(q_vector[4]*PAI_1_heart+q_vector[12]*PAI_1_wound);
push!(species_flow_vector,(1.0/volume_artery)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_artery ---------- 
push!(species_flow_vector,0.0);

# FII_kidney ---------- 
tmp_flow_term = -(q_vector[6])*FII_kidney+(q_vector[5]*FII_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_kidney ---------- 
tmp_flow_term = -(q_vector[6])*FIIa_kidney+(q_vector[5]*FIIa_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# PC_kidney ---------- 
tmp_flow_term = -(q_vector[6])*PC_kidney+(q_vector[5]*PC_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# APC_kidney ---------- 
tmp_flow_term = -(q_vector[6])*APC_kidney+(q_vector[5]*APC_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_kidney ---------- 
tmp_flow_term = -(q_vector[6])*ATIII_kidney+(q_vector[5]*ATIII_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# TM_kidney ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_kidney ---------- 
push!(species_flow_vector,0.0);

# Eps_kidney ---------- 
tmp_flow_term = -(q_vector[6])*Eps_kidney+(q_vector[5]*Eps_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_kidney ---------- 
tmp_flow_term = -(q_vector[6])*FV_FX_kidney+(q_vector[5]*FV_FX_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_kidney ---------- 
tmp_flow_term = -(q_vector[6])*FV_FXa_kidney+(q_vector[5]*FV_FXa_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_kidney ---------- 
tmp_flow_term = -(q_vector[6])*PROTHOMBINASE_PLATELETS_kidney+(q_vector[5]*PROTHOMBINASE_PLATELETS_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_kidney ---------- 
push!(species_flow_vector,0.0);

# Plasmin_kidney ---------- 
tmp_flow_term = -(q_vector[6])*Plasmin_kidney+(q_vector[5]*Plasmin_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_kidney ---------- 
tmp_flow_term = -(q_vector[6])*Fibrinogen_kidney+(q_vector[5]*Fibrinogen_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_kidney ---------- 
tmp_flow_term = -(q_vector[6])*Plasminogen_kidney+(q_vector[5]*Plasminogen_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_kidney ---------- 
tmp_flow_term = -(q_vector[6])*tPA_kidney+(q_vector[5]*tPA_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_kidney ---------- 
tmp_flow_term = -(q_vector[6])*uPA_kidney+(q_vector[5]*uPA_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_kidney ---------- 
tmp_flow_term = -(q_vector[6])*Fibrin_monomer_kidney+(q_vector[5]*Fibrin_monomer_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_kidney ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_kidney ---------- 
tmp_flow_term = -(q_vector[6])*antiplasmin_kidney+(q_vector[5]*antiplasmin_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_kidney ---------- 
tmp_flow_term = -(q_vector[6])*PAI_1_kidney+(q_vector[5]*PAI_1_artery);
push!(species_flow_vector,(1.0/volume_kidney)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_kidney ---------- 
push!(species_flow_vector,0.0);

# FII_liver ---------- 
tmp_flow_term = -(q_vector[8])*FII_liver+(q_vector[7]*FII_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_liver ---------- 
tmp_flow_term = -(q_vector[8])*FIIa_liver+(q_vector[7]*FIIa_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# PC_liver ---------- 
tmp_flow_term = -(q_vector[8])*PC_liver+(q_vector[7]*PC_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# APC_liver ---------- 
tmp_flow_term = -(q_vector[8])*APC_liver+(q_vector[7]*APC_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_liver ---------- 
tmp_flow_term = -(q_vector[8])*ATIII_liver+(q_vector[7]*ATIII_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# TM_liver ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_liver ---------- 
push!(species_flow_vector,0.0);

# Eps_liver ---------- 
tmp_flow_term = -(q_vector[8])*Eps_liver+(q_vector[7]*Eps_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_liver ---------- 
tmp_flow_term = -(q_vector[8])*FV_FX_liver+(q_vector[7]*FV_FX_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_liver ---------- 
tmp_flow_term = -(q_vector[8])*FV_FXa_liver+(q_vector[7]*FV_FXa_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_liver ---------- 
tmp_flow_term = -(q_vector[8])*PROTHOMBINASE_PLATELETS_liver+(q_vector[7]*PROTHOMBINASE_PLATELETS_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_liver ---------- 
push!(species_flow_vector,0.0);

# Plasmin_liver ---------- 
tmp_flow_term = -(q_vector[8])*Plasmin_liver+(q_vector[7]*Plasmin_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_liver ---------- 
tmp_flow_term = -(q_vector[8])*Fibrinogen_liver+(q_vector[7]*Fibrinogen_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_liver ---------- 
tmp_flow_term = -(q_vector[8])*Plasminogen_liver+(q_vector[7]*Plasminogen_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_liver ---------- 
tmp_flow_term = -(q_vector[8])*tPA_liver+(q_vector[7]*tPA_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_liver ---------- 
tmp_flow_term = -(q_vector[8])*uPA_liver+(q_vector[7]*uPA_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_liver ---------- 
tmp_flow_term = -(q_vector[8])*Fibrin_monomer_liver+(q_vector[7]*Fibrin_monomer_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_liver ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_liver ---------- 
tmp_flow_term = -(q_vector[8])*antiplasmin_liver+(q_vector[7]*antiplasmin_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_liver ---------- 
tmp_flow_term = -(q_vector[8])*PAI_1_liver+(q_vector[7]*PAI_1_artery);
push!(species_flow_vector,(1.0/volume_liver)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_liver ---------- 
push!(species_flow_vector,0.0);

# FII_bulk ---------- 
tmp_flow_term = -(q_vector[10])*FII_bulk+(q_vector[9]*FII_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_bulk ---------- 
tmp_flow_term = -(q_vector[10])*FIIa_bulk+(q_vector[9]*FIIa_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# PC_bulk ---------- 
tmp_flow_term = -(q_vector[10])*PC_bulk+(q_vector[9]*PC_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# APC_bulk ---------- 
tmp_flow_term = -(q_vector[10])*APC_bulk+(q_vector[9]*APC_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_bulk ---------- 
tmp_flow_term = -(q_vector[10])*ATIII_bulk+(q_vector[9]*ATIII_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# TM_bulk ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_bulk ---------- 
push!(species_flow_vector,0.0);

# Eps_bulk ---------- 
tmp_flow_term = -(q_vector[10])*Eps_bulk+(q_vector[9]*Eps_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_bulk ---------- 
tmp_flow_term = -(q_vector[10])*FV_FX_bulk+(q_vector[9]*FV_FX_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_bulk ---------- 
tmp_flow_term = -(q_vector[10])*FV_FXa_bulk+(q_vector[9]*FV_FXa_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_bulk ---------- 
tmp_flow_term = -(q_vector[10])*PROTHOMBINASE_PLATELETS_bulk+(q_vector[9]*PROTHOMBINASE_PLATELETS_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_bulk ---------- 
push!(species_flow_vector,0.0);

# Plasmin_bulk ---------- 
tmp_flow_term = -(q_vector[10])*Plasmin_bulk+(q_vector[9]*Plasmin_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_bulk ---------- 
tmp_flow_term = -(q_vector[10])*Fibrinogen_bulk+(q_vector[9]*Fibrinogen_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_bulk ---------- 
tmp_flow_term = -(q_vector[10])*Plasminogen_bulk+(q_vector[9]*Plasminogen_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_bulk ---------- 
tmp_flow_term = -(q_vector[10])*tPA_bulk+(q_vector[9]*tPA_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_bulk ---------- 
tmp_flow_term = -(q_vector[10])*uPA_bulk+(q_vector[9]*uPA_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_bulk ---------- 
tmp_flow_term = -(q_vector[10])*Fibrin_monomer_bulk+(q_vector[9]*Fibrin_monomer_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_bulk ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_bulk ---------- 
tmp_flow_term = -(q_vector[10])*antiplasmin_bulk+(q_vector[9]*antiplasmin_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_bulk ---------- 
tmp_flow_term = -(q_vector[10])*PAI_1_bulk+(q_vector[9]*PAI_1_artery);
push!(species_flow_vector,(1.0/volume_bulk)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_bulk ---------- 
push!(species_flow_vector,0.0);

# FII_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*FII_wound+(q_vector[11]*FII_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# FIIa_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*FIIa_wound+(q_vector[11]*FIIa_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# PC_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*PC_wound+(q_vector[11]*PC_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# APC_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*APC_wound+(q_vector[11]*APC_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# ATIII_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*ATIII_wound+(q_vector[11]*ATIII_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# TM_wound ---------- 
push!(species_flow_vector,0.0);

# TRIGGER_wound ---------- 
push!(species_flow_vector,0.0);

# Eps_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*Eps_wound+(q_vector[11]*Eps_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FX_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*FV_FX_wound+(q_vector[11]*FV_FX_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# FV_FXa_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*FV_FXa_wound+(q_vector[11]*FV_FXa_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# PROTHOMBINASE_PLATELETS_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*PROTHOMBINASE_PLATELETS_wound+(q_vector[11]*PROTHOMBINASE_PLATELETS_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_wound ---------- 
push!(species_flow_vector,0.0);

# Plasmin_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*Plasmin_wound+(q_vector[11]*Plasmin_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrinogen_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*Fibrinogen_wound+(q_vector[11]*Fibrinogen_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Plasminogen_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*Plasminogen_wound+(q_vector[11]*Plasminogen_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# tPA_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*tPA_wound+(q_vector[11]*tPA_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# uPA_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*uPA_wound+(q_vector[11]*uPA_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Fibrin_monomer_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*Fibrin_monomer_wound+(q_vector[11]*Fibrin_monomer_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Protofibril_wound ---------- 
push!(species_flow_vector,0.0);

# antiplasmin_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*antiplasmin_wound+(q_vector[11]*antiplasmin_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# PAI_1_wound ---------- 
tmp_flow_term = -(q_vector[12]+q_vector[13])*PAI_1_wound+(q_vector[11]*PAI_1_artery);
push!(species_flow_vector,(1.0/volume_wound)*tmp_flow_term);
tmp_flow_term = 0;

# Fiber_wound ---------- 
push!(species_flow_vector,0.0);

return (species_flow_vector,q_vector);
end;
