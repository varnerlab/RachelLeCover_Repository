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
function DataFile(TSTART,TSTOP,Ts)
# ----------------------------------------------------------------------------------- #
# DataFile.jl was generated using the Kwatee code generation system.
# DataFile: Stores model parameters as key - value pairs in a Julia Dict() 
# Username: rachellecover
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 08-16-2017 16:44:25
# 
# Input arguments: 
# TSTART  - Time start 
# TSTOP  - Time stop 
# Ts - Time step 
# 
# Return arguments: 
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ----------------------------------------------------------------------------------- #

# Flow related parameters - 
default_beats_per_minute = 100.0;
default_stroke_volume = 70*(1/1000);
flow_parameter_array = Float64[]
# ------------------------------------------------------------------------------------------------ #
push!(flow_parameter_array,1.0);	# 1	vein_to_heart: vein -> heart
push!(flow_parameter_array,1.0);	# 2	heart_to_lungs: heart -> lungs
push!(flow_parameter_array,1.0);	# 3	lungs_to_heart: lungs -> heart
push!(flow_parameter_array,1.0);	# 4	heart_to_artery: heart -> artery
push!(flow_parameter_array,0.25);	# 5	artery_to_kidney: artery -> kidney
push!(flow_parameter_array,0.25);	# 6	kidney_to_vein: kidney -> vein
push!(flow_parameter_array,0.25);	# 7	artery_to_liver: artery -> liver
push!(flow_parameter_array,0.25);	# 8	liver_to_vein: liver -> vein
push!(flow_parameter_array,0.499);	# 9	artery_to_bulk: artery -> bulk
push!(flow_parameter_array,0.499);	# 10	bulk_to_vein: bulk -> vein
push!(flow_parameter_array,0.002);	# 11	artery_to_wound: artery -> wound
push!(flow_parameter_array,0.0002);	# 12	artery_to_wound_reverse: wound -> artery
push!(flow_parameter_array,0.0018);	# 13	wound_to_degredation: wound -> []
# ------------------------------------------------------------------------------------------------ #

# Characteristic variables array - 
characteristic_variable_array = zeros(4);
# ------------------------------------------------------------------------------------------------ #
characteristic_volume = 1.0;
characteristic_concentration = 1.0;
characteristic_flow_rate = default_beats_per_minute*default_stroke_volume;
characteristic_time = characteristic_volume/characteristic_flow_rate;
characteristic_variable_array[1] = characteristic_volume;
characteristic_variable_array[2] = characteristic_concentration;
characteristic_variable_array[3] = characteristic_flow_rate;
characteristic_variable_array[4] = characteristic_time;
# ------------------------------------------------------------------------------------------------ #

# Load the stoichiometric matrix - 
S = float(open(readdlm,"/home/rachel/Desktop/KWateeServer-v1.0/FibrinolysisWPlatelets/network/Network.dat"));
(NSPECIES,NREACTIONS) = size(S);

# Load the stoichiometric matrix - 
C = float(open(readdlm,"/home/rachel/Desktop/KWateeServer-v1.0/FibrinolysisWPlatelets/network/Connectivity.dat"));

# Formulate the initial condition array - 
initial_condition_array = Float64[];
# ------------------------------------------------------------------------------------------------ #
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	1	vein FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	2	vein FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	3	vein PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	4	vein APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	5	vein ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	6	vein TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	7	vein TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	8	vein Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	9	vein FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	10	vein FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	11	vein PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	12	vein Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	13	vein Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	14	vein Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	15	vein Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	16	vein tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	17	vein uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	18	vein Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	19	vein Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	20	vein antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	21	vein PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	22	vein Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	23	heart FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	24	heart FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	25	heart PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	26	heart APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	27	heart ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	28	heart TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	29	heart TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	30	heart Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	31	heart FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	32	heart FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	33	heart PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	34	heart Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	35	heart Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	36	heart Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	37	heart Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	38	heart tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	39	heart uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	40	heart Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	41	heart Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	42	heart antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	43	heart PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	44	heart Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	45	lungs FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	46	lungs FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	47	lungs PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	48	lungs APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	49	lungs ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	50	lungs TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	51	lungs TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	52	lungs Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	53	lungs FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	54	lungs FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	55	lungs PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	56	lungs Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	57	lungs Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	58	lungs Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	59	lungs Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	60	lungs tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	61	lungs uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	62	lungs Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	63	lungs Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	64	lungs antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	65	lungs PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	66	lungs Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	67	artery FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	68	artery FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	69	artery PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	70	artery APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	71	artery ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	72	artery TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	73	artery TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	74	artery Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	75	artery FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	76	artery FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	77	artery PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	78	artery Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	79	artery Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	80	artery Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	81	artery Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	82	artery tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	83	artery uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	84	artery Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	85	artery Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	86	artery antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	87	artery PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	88	artery Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	89	kidney FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	90	kidney FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	91	kidney PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	92	kidney APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	93	kidney ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	94	kidney TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	95	kidney TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	96	kidney Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	97	kidney FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	98	kidney FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	99	kidney PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	100	kidney Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	101	kidney Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	102	kidney Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	103	kidney Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	104	kidney tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	105	kidney uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	106	kidney Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	107	kidney Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	108	kidney antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	109	kidney PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	110	kidney Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	111	liver FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	112	liver FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	113	liver PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	114	liver APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	115	liver ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	116	liver TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	117	liver TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	118	liver Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	119	liver FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	120	liver FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	121	liver PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	122	liver Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	123	liver Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	124	liver Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	125	liver Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	126	liver tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	127	liver uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	128	liver Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	129	liver Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	130	liver antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	131	liver PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	132	liver Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	133	bulk FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	134	bulk FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	135	bulk PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	136	bulk APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	137	bulk ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	138	bulk TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	139	bulk TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	140	bulk Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	141	bulk FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	142	bulk FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	143	bulk PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	144	bulk Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	145	bulk Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	146	bulk Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	147	bulk Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	148	bulk tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	149	bulk uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	150	bulk Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	151	bulk Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	152	bulk antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	153	bulk PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	154	bulk Fiber

push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	155	wound FII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	156	wound FIIa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	157	wound PC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	158	wound APC
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	159	wound ATIII
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	160	wound TM
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	161	wound TRIGGER
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	162	wound Eps
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	163	wound FV_FX
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	164	wound FV_FXa
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	165	wound PROTHOMBINASE_PLATELETS
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	166	wound Fibrin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	167	wound Plasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	168	wound Fibrinogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	169	wound Plasminogen
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	170	wound tPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	171	wound uPA
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	172	wound Fibrin_monomer
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	173	wound Protofibril
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	174	wound antiplasmin
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	175	wound PAI_1
push!(initial_condition_array,(1.0/characteristic_concentration)*0.0);	#	176	wound Fiber

#based on suggested refrence values for regional blood volumes in humans Legget and Williams

push!(initial_condition_array,(1.0/characteristic_volume)*.25);	#	177	vein volume_vein
push!(initial_condition_array,(1.0/characteristic_volume)*.10);	#	178	heart volume_heart
push!(initial_condition_array,(1.0/characteristic_volume)*.125);	#	179	lungs volume_lungs
push!(initial_condition_array,(1.0/characteristic_volume)*.06);	#	180	artery volume_artery
push!(initial_condition_array,(1.0/characteristic_volume)*.02);	#	181	kidney volume_kidney
push!(initial_condition_array,(1.0/characteristic_volume)*.1);	#	182	liver volume_liver
push!(initial_condition_array,(1.0/characteristic_volume)*.315);	#	183	bulk volume_bulk
push!(initial_condition_array,(1.0/characteristic_volume)*.03);	#	184	wound volume_wound
# ------------------------------------------------------------------------------------------------ #

# Formulate the time constant array - 
time_constant_array = Float64[];
# ------------------------------------------------------------------------------------------------ #
push!(time_constant_array,1.0);	#	1	vein FII
push!(time_constant_array,1.0);	#	2	vein FIIa
push!(time_constant_array,1.0);	#	3	vein PC
push!(time_constant_array,1.0);	#	4	vein APC
push!(time_constant_array,1.0);	#	5	vein ATIII
push!(time_constant_array,1.0);	#	6	vein TM
push!(time_constant_array,1.0);	#	7	vein TRIGGER
push!(time_constant_array,1.0);	#	8	vein Eps
push!(time_constant_array,1.0);	#	9	vein FV_FX
push!(time_constant_array,1.0);	#	10	vein FV_FXa
push!(time_constant_array,1.0);	#	11	vein PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	12	vein Fibrin
push!(time_constant_array,1.0);	#	13	vein Plasmin
push!(time_constant_array,1.0);	#	14	vein Fibrinogen
push!(time_constant_array,1.0);	#	15	vein Plasminogen
push!(time_constant_array,1.0);	#	16	vein tPA
push!(time_constant_array,1.0);	#	17	vein uPA
push!(time_constant_array,1.0);	#	18	vein Fibrin_monomer
push!(time_constant_array,1.0);	#	19	vein Protofibril
push!(time_constant_array,1.0);	#	20	vein antiplasmin
push!(time_constant_array,1.0);	#	21	vein PAI_1
push!(time_constant_array,1.0);	#	22	vein Fiber

push!(time_constant_array,1.0);	#	23	heart FII
push!(time_constant_array,1.0);	#	24	heart FIIa
push!(time_constant_array,1.0);	#	25	heart PC
push!(time_constant_array,1.0);	#	26	heart APC
push!(time_constant_array,1.0);	#	27	heart ATIII
push!(time_constant_array,1.0);	#	28	heart TM
push!(time_constant_array,1.0);	#	29	heart TRIGGER
push!(time_constant_array,1.0);	#	30	heart Eps
push!(time_constant_array,1.0);	#	31	heart FV_FX
push!(time_constant_array,1.0);	#	32	heart FV_FXa
push!(time_constant_array,1.0);	#	33	heart PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	34	heart Fibrin
push!(time_constant_array,1.0);	#	35	heart Plasmin
push!(time_constant_array,1.0);	#	36	heart Fibrinogen
push!(time_constant_array,1.0);	#	37	heart Plasminogen
push!(time_constant_array,1.0);	#	38	heart tPA
push!(time_constant_array,1.0);	#	39	heart uPA
push!(time_constant_array,1.0);	#	40	heart Fibrin_monomer
push!(time_constant_array,1.0);	#	41	heart Protofibril
push!(time_constant_array,1.0);	#	42	heart antiplasmin
push!(time_constant_array,1.0);	#	43	heart PAI_1
push!(time_constant_array,1.0);	#	44	heart Fiber

push!(time_constant_array,1.0);	#	45	lungs FII
push!(time_constant_array,1.0);	#	46	lungs FIIa
push!(time_constant_array,1.0);	#	47	lungs PC
push!(time_constant_array,1.0);	#	48	lungs APC
push!(time_constant_array,1.0);	#	49	lungs ATIII
push!(time_constant_array,1.0);	#	50	lungs TM
push!(time_constant_array,1.0);	#	51	lungs TRIGGER
push!(time_constant_array,1.0);	#	52	lungs Eps
push!(time_constant_array,1.0);	#	53	lungs FV_FX
push!(time_constant_array,1.0);	#	54	lungs FV_FXa
push!(time_constant_array,1.0);	#	55	lungs PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	56	lungs Fibrin
push!(time_constant_array,1.0);	#	57	lungs Plasmin
push!(time_constant_array,1.0);	#	58	lungs Fibrinogen
push!(time_constant_array,1.0);	#	59	lungs Plasminogen
push!(time_constant_array,1.0);	#	60	lungs tPA
push!(time_constant_array,1.0);	#	61	lungs uPA
push!(time_constant_array,1.0);	#	62	lungs Fibrin_monomer
push!(time_constant_array,1.0);	#	63	lungs Protofibril
push!(time_constant_array,1.0);	#	64	lungs antiplasmin
push!(time_constant_array,1.0);	#	65	lungs PAI_1
push!(time_constant_array,1.0);	#	66	lungs Fiber

push!(time_constant_array,1.0);	#	67	artery FII
push!(time_constant_array,1.0);	#	68	artery FIIa
push!(time_constant_array,1.0);	#	69	artery PC
push!(time_constant_array,1.0);	#	70	artery APC
push!(time_constant_array,1.0);	#	71	artery ATIII
push!(time_constant_array,1.0);	#	72	artery TM
push!(time_constant_array,1.0);	#	73	artery TRIGGER
push!(time_constant_array,1.0);	#	74	artery Eps
push!(time_constant_array,1.0);	#	75	artery FV_FX
push!(time_constant_array,1.0);	#	76	artery FV_FXa
push!(time_constant_array,1.0);	#	77	artery PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	78	artery Fibrin
push!(time_constant_array,1.0);	#	79	artery Plasmin
push!(time_constant_array,1.0);	#	80	artery Fibrinogen
push!(time_constant_array,1.0);	#	81	artery Plasminogen
push!(time_constant_array,1.0);	#	82	artery tPA
push!(time_constant_array,1.0);	#	83	artery uPA
push!(time_constant_array,1.0);	#	84	artery Fibrin_monomer
push!(time_constant_array,1.0);	#	85	artery Protofibril
push!(time_constant_array,1.0);	#	86	artery antiplasmin
push!(time_constant_array,1.0);	#	87	artery PAI_1
push!(time_constant_array,1.0);	#	88	artery Fiber

push!(time_constant_array,1.0);	#	89	kidney FII
push!(time_constant_array,1.0);	#	90	kidney FIIa
push!(time_constant_array,1.0);	#	91	kidney PC
push!(time_constant_array,1.0);	#	92	kidney APC
push!(time_constant_array,1.0);	#	93	kidney ATIII
push!(time_constant_array,1.0);	#	94	kidney TM
push!(time_constant_array,1.0);	#	95	kidney TRIGGER
push!(time_constant_array,1.0);	#	96	kidney Eps
push!(time_constant_array,1.0);	#	97	kidney FV_FX
push!(time_constant_array,1.0);	#	98	kidney FV_FXa
push!(time_constant_array,1.0);	#	99	kidney PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	100	kidney Fibrin
push!(time_constant_array,1.0);	#	101	kidney Plasmin
push!(time_constant_array,1.0);	#	102	kidney Fibrinogen
push!(time_constant_array,1.0);	#	103	kidney Plasminogen
push!(time_constant_array,1.0);	#	104	kidney tPA
push!(time_constant_array,1.0);	#	105	kidney uPA
push!(time_constant_array,1.0);	#	106	kidney Fibrin_monomer
push!(time_constant_array,1.0);	#	107	kidney Protofibril
push!(time_constant_array,1.0);	#	108	kidney antiplasmin
push!(time_constant_array,1.0);	#	109	kidney PAI_1
push!(time_constant_array,1.0);	#	110	kidney Fiber

push!(time_constant_array,1.0);	#	111	liver FII
push!(time_constant_array,1.0);	#	112	liver FIIa
push!(time_constant_array,1.0);	#	113	liver PC
push!(time_constant_array,1.0);	#	114	liver APC
push!(time_constant_array,1.0);	#	115	liver ATIII
push!(time_constant_array,1.0);	#	116	liver TM
push!(time_constant_array,1.0);	#	117	liver TRIGGER
push!(time_constant_array,1.0);	#	118	liver Eps
push!(time_constant_array,1.0);	#	119	liver FV_FX
push!(time_constant_array,1.0);	#	120	liver FV_FXa
push!(time_constant_array,1.0);	#	121	liver PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	122	liver Fibrin
push!(time_constant_array,1.0);	#	123	liver Plasmin
push!(time_constant_array,1.0);	#	124	liver Fibrinogen
push!(time_constant_array,1.0);	#	125	liver Plasminogen
push!(time_constant_array,1.0);	#	126	liver tPA
push!(time_constant_array,1.0);	#	127	liver uPA
push!(time_constant_array,1.0);	#	128	liver Fibrin_monomer
push!(time_constant_array,1.0);	#	129	liver Protofibril
push!(time_constant_array,1.0);	#	130	liver antiplasmin
push!(time_constant_array,1.0);	#	131	liver PAI_1
push!(time_constant_array,1.0);	#	132	liver Fiber

push!(time_constant_array,1.0);	#	133	bulk FII
push!(time_constant_array,1.0);	#	134	bulk FIIa
push!(time_constant_array,1.0);	#	135	bulk PC
push!(time_constant_array,1.0);	#	136	bulk APC
push!(time_constant_array,1.0);	#	137	bulk ATIII
push!(time_constant_array,1.0);	#	138	bulk TM
push!(time_constant_array,1.0);	#	139	bulk TRIGGER
push!(time_constant_array,1.0);	#	140	bulk Eps
push!(time_constant_array,1.0);	#	141	bulk FV_FX
push!(time_constant_array,1.0);	#	142	bulk FV_FXa
push!(time_constant_array,1.0);	#	143	bulk PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	144	bulk Fibrin
push!(time_constant_array,1.0);	#	145	bulk Plasmin
push!(time_constant_array,1.0);	#	146	bulk Fibrinogen
push!(time_constant_array,1.0);	#	147	bulk Plasminogen
push!(time_constant_array,1.0);	#	148	bulk tPA
push!(time_constant_array,1.0);	#	149	bulk uPA
push!(time_constant_array,1.0);	#	150	bulk Fibrin_monomer
push!(time_constant_array,1.0);	#	151	bulk Protofibril
push!(time_constant_array,1.0);	#	152	bulk antiplasmin
push!(time_constant_array,1.0);	#	153	bulk PAI_1
push!(time_constant_array,1.0);	#	154	bulk Fiber

push!(time_constant_array,1.0);	#	155	wound FII
push!(time_constant_array,1.0);	#	156	wound FIIa
push!(time_constant_array,1.0);	#	157	wound PC
push!(time_constant_array,1.0);	#	158	wound APC
push!(time_constant_array,1.0);	#	159	wound ATIII
push!(time_constant_array,1.0);	#	160	wound TM
push!(time_constant_array,1.0);	#	161	wound TRIGGER
push!(time_constant_array,1.0);	#	162	wound Eps
push!(time_constant_array,1.0);	#	163	wound FV_FX
push!(time_constant_array,1.0);	#	164	wound FV_FXa
push!(time_constant_array,1.0);	#	165	wound PROTHOMBINASE_PLATELETS
push!(time_constant_array,1.0);	#	166	wound Fibrin
push!(time_constant_array,1.0);	#	167	wound Plasmin
push!(time_constant_array,1.0);	#	168	wound Fibrinogen
push!(time_constant_array,1.0);	#	169	wound Plasminogen
push!(time_constant_array,1.0);	#	170	wound tPA
push!(time_constant_array,1.0);	#	171	wound uPA
push!(time_constant_array,1.0);	#	172	wound Fibrin_monomer
push!(time_constant_array,1.0);	#	173	wound Protofibril
push!(time_constant_array,1.0);	#	174	wound antiplasmin
push!(time_constant_array,1.0);	#	175	wound PAI_1
push!(time_constant_array,1.0);	#	176	wound Fiber

push!(time_constant_array,1.0);	#	177	vein volume_vein
push!(time_constant_array,1.0);	#	178	heart volume_heart
push!(time_constant_array,1.0);	#	179	lungs volume_lungs
push!(time_constant_array,1.0);	#	180	artery volume_artery
push!(time_constant_array,1.0);	#	181	kidney volume_kidney
push!(time_constant_array,1.0);	#	182	liver volume_liver
push!(time_constant_array,1.0);	#	183	bulk volume_bulk
push!(time_constant_array,1.0);	#	184	wound volume_wound
# ------------------------------------------------------------------------------------------------ #

# Formulate the rate constant array - 
rate_constant_array = Float64[];
# ------------------------------------------------------------------------------------------------ #
# vein
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 1	vein	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 2	vein	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 3	vein	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 4	vein	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 5	vein	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 6	vein	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 7	vein	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 8	vein	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 9	vein	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 10	vein	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 11	vein	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 12	vein	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 13	vein	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 14	vein	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 15	vein	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 16	vein	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 17	vein	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 18	vein	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 19	vein	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 20	vein	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 21	vein	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 22	vein	reaction22: compartment: * [] -([])-> Fiber

# heart
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 23	heart	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 24	heart	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 25	heart	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 26	heart	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 27	heart	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 28	heart	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 29	heart	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 30	heart	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 31	heart	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 32	heart	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 33	heart	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 34	heart	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 35	heart	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 36	heart	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 37	heart	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 38	heart	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 39	heart	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 40	heart	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 41	heart	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 42	heart	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 43	heart	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 44	heart	reaction22: compartment: * [] -([])-> Fiber

# lungs
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 45	lungs	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 46	lungs	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 47	lungs	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 48	lungs	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 49	lungs	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 50	lungs	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 51	lungs	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 52	lungs	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 53	lungs	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 54	lungs	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 55	lungs	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 56	lungs	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 57	lungs	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 58	lungs	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 59	lungs	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 60	lungs	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 61	lungs	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 62	lungs	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 63	lungs	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 64	lungs	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 65	lungs	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 66	lungs	reaction22: compartment: * [] -([])-> Fiber

# artery
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 67	artery	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 68	artery	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 69	artery	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 70	artery	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 71	artery	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 72	artery	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 73	artery	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 74	artery	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 75	artery	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 76	artery	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 77	artery	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 78	artery	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 79	artery	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 80	artery	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 81	artery	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 82	artery	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 83	artery	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 84	artery	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 85	artery	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 86	artery	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 87	artery	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 88	artery	reaction22: compartment: * [] -([])-> Fiber

# kidney
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 89	kidney	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 90	kidney	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 91	kidney	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 92	kidney	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 93	kidney	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 94	kidney	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 95	kidney	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 96	kidney	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 97	kidney	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 98	kidney	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 99	kidney	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 100	kidney	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 101	kidney	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 102	kidney	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 103	kidney	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 104	kidney	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 105	kidney	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 106	kidney	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 107	kidney	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 108	kidney	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 109	kidney	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 110	kidney	reaction22: compartment: * [] -([])-> Fiber

# liver
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 111	liver	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 112	liver	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 113	liver	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 114	liver	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 115	liver	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 116	liver	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 117	liver	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 118	liver	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 119	liver	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 120	liver	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 121	liver	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 122	liver	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 123	liver	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 124	liver	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 125	liver	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 126	liver	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 127	liver	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 128	liver	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 129	liver	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 130	liver	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 131	liver	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 132	liver	reaction22: compartment: * [] -([])-> Fiber

# bulk
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 133	bulk	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 134	bulk	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 135	bulk	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 136	bulk	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 137	bulk	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 138	bulk	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 139	bulk	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 140	bulk	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 141	bulk	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 142	bulk	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 143	bulk	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 144	bulk	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 145	bulk	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 146	bulk	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 147	bulk	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 148	bulk	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 149	bulk	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 150	bulk	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 151	bulk	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 152	bulk	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 153	bulk	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 154	bulk	reaction22: compartment: * [] -([])-> Fiber

# wound
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 155	wound	reaction1: compartment: * [] -([])-> FII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 156	wound	reaction2: compartment: * [] -([])-> FIIa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 157	wound	reaction3: compartment: * [] -([])-> PC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 158	wound	reaction4: compartment: * [] -([])-> APC
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 159	wound	reaction5: compartment: * [] -([])-> ATIII
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 160	wound	reaction6: compartment: * [] -([])-> TM
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 161	wound	reaction7: compartment: * [] -([])-> TRIGGER
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 162	wound	reaction8: compartment: * [] -([])-> Eps
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 163	wound	reaction9: compartment: * [] -([])-> FV_FX
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 164	wound	reaction10: compartment: * [] -([])-> FV_FXa
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 165	wound	reaction11: compartment: * [] -([])-> PROTHOMBINASE_PLATELETS
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 166	wound	reaction12: compartment: * [] -([])-> Fibrin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 167	wound	reaction13: compartment: * [] -([])-> Plasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 168	wound	reaction14: compartment: * [] -([])-> Fibrinogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 169	wound	reaction15: compartment: * [] -([])-> Plasminogen
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 170	wound	reaction16: compartment: * [] -([])-> tPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 171	wound	reaction17: compartment: * [] -([])-> uPA
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 172	wound	reaction18: compartment: * [] -([])-> Fibrin_monomer
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 173	wound	reaction19: compartment: * [] -([])-> Protofibril
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 174	wound	reaction20: compartment: * [] -([])-> antiplasmin
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 175	wound	reaction21: compartment: * [] -([])-> PAI_1
push!(rate_constant_array,(characteristic_time/characteristic_concentration)*1.0);	# 176	wound	reaction22: compartment: * [] -([])-> Fiber

# ------------------------------------------------------------------------------------------------ #

# Formulate the saturation constant array - 
saturation_constant_array = zeros(NREACTIONS,NSPECIES);
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# Formulate control parameter array - 
control_parameter_array = zeros(0,2);
# ------------------------------------------------------------------------------------------------ #
# vein

# heart

# lungs

# artery

# kidney

# liver

# bulk

# wound

# ------------------------------------------------------------------------------------------------ #

# Input concentration array - 
input_concentration_array = Float64[]
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# ---------------------------- DO NOT EDIT BELOW THIS LINE --------------------------------------- #
data_dictionary = Dict();
data_dictionary["CHARACTERISTIC_VARIABLE_ARRAY"] = characteristic_variable_array;
data_dictionary["INPUT_CONCENTRATION_ARRAY"] = input_concentration_array;
data_dictionary["DEFAULT_BEATS_PER_MINUTE"] = default_beats_per_minute;
data_dictionary["DEFAULT_STROKE_VOLUME"] = default_stroke_volume;
data_dictionary["FLOW_PARAMETER_ARRAY"] = flow_parameter_array;
data_dictionary["STOICHIOMETRIC_MATRIX"] = S;
data_dictionary["FLOW_CONNECTIVITY_MATRIX"] = C;
data_dictionary["RATE_CONSTANT_ARRAY"] = rate_constant_array;
data_dictionary["SATURATION_CONSTANT_ARRAY"] = saturation_constant_array;
data_dictionary["INITIAL_CONDITION_ARRAY"] = initial_condition_array;
data_dictionary["TIME_CONSTANT_ARRAY"] = time_constant_array;
data_dictionary["CONTROL_PARAMETER_ARRAY"] = control_parameter_array;
# ------------------------------------------------------------------------------------------------ #
return data_dictionary;
end
