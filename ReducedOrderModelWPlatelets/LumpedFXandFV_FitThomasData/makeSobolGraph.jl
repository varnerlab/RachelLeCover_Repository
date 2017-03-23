using PyPlot

function makeSobolGraph()
	close("all")
	fig=figure(figsize=[20,10])
	data = readdlm("sensitivity/SobolResultsPM50N500.txt")
	topHalf = data[1:47, :]
	@show topHalf
	usefulData = topHalf[2:end, :]
	positions = collect(1:46)
	bar(positions, usefulData[:,4],color = "k", yerr=usefulData[:,5])
	ax = gca()
	ax[:xaxis][:set_ticks](positions)
	ax[:xaxis][:set_ticklabels](usefulData[:,1], rotation = 60, fontsize = 8)
	ylabel("Total Order Sensitivity Indicies")
	savefig("sensitivity/SobolTotalOrderN500.pdf")
	
end
