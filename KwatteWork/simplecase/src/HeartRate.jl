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
function HeartRate(t,x,beats_per_minute,stroke_volume,data_dictionary)
# ---------------------------------------------------------------------- #
# HeartRate.jl was generated using the Kwatee code generation system.
# Username: jeffreyvarner
# Type: PBPK-JULIA
# Version: 1.0
# Generation timestamp: 02-25-2016 11:20:11
# 
# Arguments: 
# t  - current time 
# x  - state vector 
# beats_per_minute - heart beats per minute
# stoke_volume - stroke volume per beat
# data_dictionary  - Data dictionary instance (holds model parameters) 
# ---------------------------------------------------------------------- #

# Alias the species vector - 
# compartment_1
A_compartment_1 = x[1];
B_compartment_1 = x[2];
E_compartment_1 = x[3];

# compartment_2
A_compartment_2 = x[4];
B_compartment_2 = x[5];
E_compartment_2 = x[6];

# compartment_3
A_compartment_3 = x[7];
B_compartment_3 = x[8];
E_compartment_3 = x[9];
volume_compartment_1 = x[10];
volume_compartment_2 = x[11];
volume_compartment_3 = x[12];

# Update the beats_per_minute - 
beats_per_minute = beats_per_minute;

# Update the stroke volume - 
stroke_volume = stroke_volume;

return (beats_per_minute,stroke_volume);
end;
