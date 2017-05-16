using PyPlot

function makeSobolGraph()
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
	ylabel("Total Order Sensitivity Indicies")
	axis("tight")
	axis([0,numparams,0,1])
	savefig("sensitivity/SobolTotalOrderN5000.pdf", bbox="tight")
	
end
