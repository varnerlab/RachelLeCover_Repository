include("SolveBalances.jl")
include("DataFile.jl")
using PyPlot;

function runModel()
	close("all");
	tstart = 0.0;
	tend = 1.0;
	step = .02;
	data_dict = DataFile(tstart, tend, step)
	t, x = SolveBalances(tstart, tend, step, data_dict)
	# Alias the species vector - 
	A_cell = x[:,1];
	B_cell = x[:,2];
	E1_cell = x[:,3];
	C_cell = x[:,4];
	E2_cell = x[:,5];
	D_cell = x[:,6];
	E3_cell = x[:,7];
	E4_cell = x[:,8];

	# outside
	A_outside = x[:,9];
	B_outside = x[:,10];
	E1_outside = x[:,11];
	C_outside = x[:,12];
	E2_outside = x[:,13];
	D_outside = x[:,14];
	E3_outside = x[:,15];
	E4_outside = x[:,16];

	volume_cell = x[:,17];
	volume_outside = x[:,18];


	
	figure(figsize=(15,20))
	PyPlot.hold(true)
	plt[:subplot](331)
	plot(t, A_cell)
	title("A_cell")
	plt[:subplot](332)
	plot(t, B_cell)
	title("B_cell")
	plt[:subplot](333)
	plot(t, C_cell)
	title("C_cell")
	plt[:subplot](334)
	plot(t, D_cell)
	title("D_cell")
	plt[:subplot](335)
	plot(t, E1_cell)
	title("E1_cell")
	plt[:subplot](336)
	plot(t, E2_cell)
	title("E2_cell")
	plt[:subplot](337)
	plot(t, E3_cell)
	title("E3_cell")
	plt[:subplot](338)
	plot(t, E4_cell)
	title("E4_cell")

	plt[:subplot](339)
	plot(t, volume_cell)
	title("volume_cell")
	
	
	end


runModel()
