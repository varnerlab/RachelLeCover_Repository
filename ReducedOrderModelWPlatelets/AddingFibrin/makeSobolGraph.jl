using PyPlot
using PyCall
PyDict(pyimport("matplotlib")["rcParams"])["font.sans-serif"] = ["Helvetica"]

function makeSobolGraph()
	font1 = Dict("family"=>"sans-serif",
	    "color"=>"black",
	    "weight"=>"normal",
	    "size"=>24)

	font2 = Dict("family"=>"sans-serif",
	    "color"=>"black",
	    "weight"=>"normal",
	    "size"=>12)
	close("all")
	numparams = 77
	fig=figure(figsize=[25,15])
	data = readdlm("sensitivity/SobolOputput_pm50_N5000_04_24_2017.txt")
	topHalf = data[1:numparams+1, :]
	@show topHalf
	usefulData = topHalf[2:end, :]
	positions = collect(0:numparams-1)
	bar(positions, usefulData[:,4],color = "k", yerr=usefulData[:,5], align="center")
	ax = gca()
	ax[:xaxis][:set_ticks](positions)
	ax[:xaxis][:set_ticklabels](usefulData[:,1], rotation = 80, fontsize = 5)
	ylabel("Total Order Sensitivity Indicies", fontdict=font1)
	axis("tight")
	axis([0,numparams,0,1])
	ax[:tick_params](labelsize=20)
	#lines and label for kinetic parameters
	ax[:xaxis][:set_ticklabels]([], rotation = 80, fontsize = 5)
	annotate("",
		xy=[.125;.83],
		xycoords="figure fraction",
		xytext=[.3,0.83],
		textcoords="figure fraction",
		ha="right",
		va="top",
		arrowprops = Dict("facecolor"=> "black", "arrowstyle" => "-" ))
	annotate("Thombin Generation Kinetic Parameters",
		xy=[.12;.81],
		xycoords="figure fraction",
		xytext=[.29,0.81],
		textcoords="figure fraction",
		ha="right",
		va="top")

	annotate("",
		xy=[.3;.72],
		xycoords="figure fraction",
		xytext=[.5,0.72],
		textcoords="figure fraction",
		ha="right",
		va="top",
		arrowprops = Dict("facecolor"=> "black", "arrowstyle" => "-" ))

	annotate("Thrombin Generation Control Parameters",
		xy=[.3;.71],
		xycoords="figure fraction",
		xytext=[.475,0.71],
		textcoords="figure fraction",
		ha="right",
		va="top")

	annotate("",
		xy=[.505;.83],
		xycoords="figure fraction",
		xytext=[.59,0.83],
		textcoords="figure fraction",
		ha="right",
		va="top",
		arrowprops = Dict("facecolor"=> "black", "arrowstyle" => "-" ))

	annotate("Platelet Parameters",
		xy=[.3;.82],
		xycoords="figure fraction",
		xytext=[.575,0.82],
		textcoords="figure fraction",
		ha="right",
		va="top")

	annotate("",
		xy=[.595;.64],
		xycoords="figure fraction",
		xytext=[.81,0.64],
		textcoords="figure fraction",
		ha="right",
		va="top",
		arrowprops = Dict("facecolor"=> "black", "arrowstyle" => "-" ))

	annotate("Fibrin Kinetic Parameters",
		xy=[.65;.63],
		xycoords="figure fraction",
		xytext=[.75,0.63],
		textcoords="figure fraction",
		ha="right",
		va="top")

		annotate("",
		xy=[.815;.85],
		xycoords="figure fraction",
		xytext=[.9,0.85],
		textcoords="figure fraction",
		ha="right",
		va="top",
		arrowprops = Dict("facecolor"=> "black", "arrowstyle" => "-" ))

	annotate("Fibrin Control Parameters",
		xy=[.85;.82],
		xycoords="figure fraction",
		xytext=[.9,0.82],
		textcoords="figure fraction",
		ha="right",
		va="top")
	savefig("sensitivity/SobolTotalOrderN5000.pdf")
	
end
