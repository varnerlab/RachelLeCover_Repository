using PyPlot
using PyCall
PyCall.PyDict(matplotlib["rcParams"])["font.sans-serif"] = ["Helvetica"]

function plotPretty(t,x)
	close("all")
	names = ["FII", "FIIa", "PC", "APC", "ATIII", "TM", "TRIGGER", "Fraction Activated Platelets", "FV_FX", "FV_FXa", "Prothombinase-Platelets",
	"Fibrin", "Plasmin", "Fibrinogen", "Plasminogen", "tPA", "uPA", "fibrin monomer", "proto-fibril", "anti-plasmin", "PAI_1", "Fiber"]
	compartments = ["veins", "heart", "lungs", "arteries", "kidney", "liver", "bulk", "wound"]
	#figure(figsize=(20,20))
	#PyPlot.hold(true)
	#plt[:tight_layout]() 	 #to prevent plots from overlapping
	f, axarr = subplots(size(names,1), size(compartments,1),sharey="row", sharex="col", figsize=(20,20),dpi=100)
	for j in collect(1:size(names,1))
		offset = j
		for k in collect(1:size(compartments,1))
			axarr[j,k][:plot](t, [a[offset+(k-1)*size(names,1)] for a in x], linewidth=2.0, "k")
			@show offset
			if(offset==1)
				currymin = 200
				currymax=1400
			elseif(offset ==2)
				currymin=0
				currymax = 140
			elseif(offset ==3)
				currymax=70
				currymin=0
			elseif(offset ==4)
				currymax=70
				currymin=0
			elseif(offset ==5)
				currymax=3600
				currymin=2200
			elseif(offset ==6)
				currymax=13
				currymin=11
			elseif(offset ==7)
				currymax =.006
				currymin = 0.0
			elseif(offset ==8)
				currymax=1.0
				currymin=0.0
			elseif(offset==9)
				currymax = 22.005
				currymin = 21.97
			elseif(offset==10)
				currymax=1E-6
				currymin = 0.0
			elseif(offset==11)
				currymax = 80
				currymin=0
			elseif(offset==12)
				currymax = .06
				currymin=0
			elseif(offset==13)
				currymax = 7450
				currymin=7350
			elseif(offset==14)
				currymax = 2000
				currymin=0
			elseif(offset==15)
				currymax = 2.0
				currymin=0
			elseif(offset==16)
				currymax = .06
				currymin=0
			elseif(offset==17)
				currymax = 1.0
				currymin=0
			elseif(offset==18)
				currymax =.1
				currymin=0
			elseif(offset==19)
				currymax = .06
				currymin=0	
			elseif(offset==20)
				currymax = 1200
				currymin=800
			elseif(offset==21)
				currymax = 1.0
				currymin=0
			elseif(offset==22)
				currymax = 3.0
				currymin=0

			else
				currymax =2000
				currymin=0.0
			end
			ax = gca()
			ax[:set_ylim](ymin=currymin, ymax = currymax)
			axarr[j,k][:ticklabel_format](axis="y", useOffset=false)
			axarr[j,k][:tick_params]("both", labelsize=4)
		end
	end
	for i in collect(1:size(compartments,1))
		axarr[1,i][:set_title](compartments[i])
	end

	for i in collect(1:size(names,1))
		if(length(names[i])>5)
			fs = 6
		elseif(length(names[i])>10)
			fs = 4
		else
			fs = 8
		end
		axarr[i,1][:set_ylabel](replace(replace(names[i], ' ', '\n'),'-', '\n'),fontsize = fs,rotation=90)
	end
	plt[:show]()
	savefig("../figures/21_08_17Pretty.png")
end

function plotPretty(t,alldata)
	close("all")
	names = ["FII", "FIIa", "PC", "APC", "ATIII", "TM", "TRIGGER", "Fraction Activated Platelets", "FV_FX", "FV_FXa", "Prothombinase-Platelets",
	"Fibrin", "Plasmin", "Fibrinogen", "Plasminogen", "tPA", "uPA", "fibrin monomer", "proto-fibril", "anti-plasmin", "PAI_1", "Fiber"]
	compartments = ["veins", "heart", "lungs", "arteries", "kidney", "liver", "bulk", "wound"]
	#figure(figsize=(20,20))
	#PyPlot.hold(true)
	#plt[:tight_layout]() 	 #to prevent plots from overlapping
	f, axarr = subplots(size(names,1), size(compartments,1),sharey="row", sharex="col", figsize=(20,20),dpi=100)
	x = squeeze(mean(alldata,3),3)#caclulate mean
	stdev =squeeze(std(alldata,3),3)
	maxticks = 4
	for j in collect(1:size(names,1))
		offset = j
		for k in collect(1:size(compartments,1))
			currmean =  x[offset+(k-1)*size(names,1),:]
			#@show size(currmean)
			#@show size(t)
			axarr[j,k][:plot](t, currmean, linewidth=2.0, "k")
			upper = currmean +1.96*stdev[offset+(k-1)*size(names,1),:]
			lower =currmean -1.96*stdev[offset+(k-1)*size(names,1),:]
			axarr[j,k][:fill_between](t,vec(upper),vec(lower), color = ".5", alpha = .5)
			@show offset
			if(offset==1)
				currymin = 0
				currymax=2000
			elseif(offset ==2)
				currymin=0
				currymax = 250
			elseif(offset ==3)
				currymax=70
				currymin=0
			elseif(offset ==4)
				currymax=60
				currymin=0
			elseif(offset ==5)
				currymax=4000
				currymin=2000
			elseif(offset ==6)
				currymax=15
				currymin=10
			elseif(offset ==7)
				currymax =.01
				currymin = 0.0
			elseif(offset ==8)
				currymax=1.0
				currymin=0.0
			elseif(offset==9)
				currymax = 22.00
				currymin = 21.9
			elseif(offset==10)
				currymax=1E-6
				currymin = 0.0
			elseif(offset==11)
				currymax = 100
				currymin=0
			elseif(offset==12)
				currymax = .2
				currymin=0
			elseif(offset==13)
				currymax = 7450
				currymin=7200
			elseif(offset==14)
				currymax = 2000
				currymin=1800
			elseif(offset==15)
				currymax = 2.0
				currymin=0
			elseif(offset==16)
				currymax = .2
				currymin=0
			elseif(offset==17)
				currymax = 1.5
				currymin=0
			elseif(offset==18)
				currymax =.2
				currymin=0
			elseif(offset==19)
				currymax = .4
				currymin=0	
			elseif(offset==20)
				currymax = 1300
				currymin=800
			elseif(offset==21)
				currymax = 1.0
				currymin=0
			elseif(offset==22)
				currymax = 5.0
				currymin=0

			else
				currymax =2000
				currymin=0.0
			end
			ax = gca()
			ax[:set_ylim](ymin=currymin, ymax = currymax)
#			ymin,ymax = ylim()
#			@show ymin
#			if(ymin<0)
#				axarr[j,k][:set_ylim](ymin=0.0) #make it so plots don't go negative
#			end
			axarr[j,k][:ticklabel_format](axis="y", useOffset=false)
			axarr[j,k][:tick_params]("both", labelsize=4)
			axarr[j,k][:locator_params](nbins = 4, axis = "y")
		end
	end
	for i in collect(1:size(compartments,1))
		axarr[1,i][:set_title](compartments[i])
	end

	for i in collect(1:size(names,1))
		if(length(names[i])>5)
			fs = 6
		elseif(length(names[i])>10)
			fs = 4
		else
			fs = 8
		end
		axarr[i,1][:set_ylabel](replace(replace(names[i], ' ', '\n'),'-', '\n'),fontsize = fs,rotation=90)
		ax = gca()
		#yloc=plt[:MaxNLocator](maxticks)
		#ax[:yaxis][:set_major_locator](yloc)
		#plt[:locator_params](nbins = 4, axis = 'y')
	end
	plt[:show]()
	savefig("../figures/25_08_17PrettyMeanLowerHR.pdf")

end

function plotPrettySelectSpecies(t,alldata,selectedSpecies)
close("all")
	names = ["FII", "FIIa", "PC", "APC", "ATIII", "TM", "TRIGGER", "Fraction Activated Platelets", "FV_FX", "FV_FXa", "Prothombinase-Platelets",
	"Fibrin", "Plasmin", "Fibrinogen", "Plasminogen", "tPA", "uPA", "fibrin monomer", "proto-fibril", "anti-plasmin", "PAI_1", "Fiber"]
	compartments = ["Veins", "Heart", "Lungs", "Arteries", "Kidney", "Liver", "Bulk", "Wound"]
	#figure(figsize=(20,20))
	#PyPlot.hold(true)
	#plt[:tight_layout]() 	 #to prevent plots from overlapping
	
	f, axarr = subplots(size(selectedSpecies,1), size(compartments,1),sharey="row", sharex="col", figsize=(20,20),dpi=100)
	@show size(axarr)
	x = squeeze(mean(alldata,3),3)#caclulate mean
	stdev =squeeze(std(alldata,3),3)
	maxticks = 4
	count = 1
	for j in selectedSpecies
		offset = j
		for k in collect(1:size(compartments,1))
			#@show k
			#@show offset+(k-1)*size(names,1)
			currmean =  x[offset+(k-1)*size(names,1),:]
			#@show size(currmean)
			#@show size(t)
			axarr[count,k][:plot](t, currmean, linewidth=2.0, "k")
			upper = currmean +1.96*stdev[offset+(k-1)*size(names,1),:]
			lower =currmean -1.96*stdev[offset+(k-1)*size(names,1),:]
			axarr[count,k][:fill_between](t,vec(upper),vec(lower), color = ".5", alpha = .5)
			#@show offset
			if(offset==1)
				currymin = 0
				currymax=2000
			elseif(offset ==2)
				currymin=0
				currymax = 250
			elseif(offset ==3)
				currymax=70
				currymin=0
			elseif(offset ==4)
				currymax=60
				currymin=0
			elseif(offset ==5)
				currymax=4000
				currymin=2000
			elseif(offset ==6)
				currymax=15
				currymin=10
			elseif(offset ==7)
				currymax =.01
				currymin = 0.0
			elseif(offset ==8)
				currymax=1.0
				currymin=0.0
			elseif(offset==9)
				currymax = 22.00
				currymin = 21.9
			elseif(offset==10)
				currymax=1E-6
				currymin = 0.0
			elseif(offset==11)
				currymax = 100
				currymin=0
			elseif(offset==12)
				currymax = .2
				currymin=0
			elseif(offset==13)
				currymax = 7450
				currymin=7200
			elseif(offset==14)
				currymax = 2000
				currymin=1800
			elseif(offset==15)
				currymax = 2.0
				currymin=0
			elseif(offset==16)
				currymax = .2
				currymin=0
			elseif(offset==17)
				currymax = 1.5
				currymin=0
			elseif(offset==18)
				currymax =.2
				currymin=0
			elseif(offset==19)
				currymax = .4
				currymin=0	
			elseif(offset==20)
				currymax = 1300
				currymin=800
			elseif(offset==21)
				currymax = 1.0
				currymin=0
			elseif(offset==22)
				currymax = 5.0
				currymin=0

			else
				currymax =2000
				currymin=0.0
			end
			axarr[count,k][:set_ylim](ymin=currymin, ymax = currymax)
#			ymin,ymax = ylim()
##			@show ymin
#			if(ymin<0)
#				axarr[j,k][:set_ylim](ymin=0.0) #make it so plots don't go negative
#			end
			axarr[count,k][:ticklabel_format](axis="y", useOffset=false)
			axarr[count,k][:tick_params]("both", labelsize=18)
			axarr[count,k][:locator_params](nbins = 4, axis = "y")
			axarr[count,k][:locator_params](nbins = 4, axis = "x")
		end
		count =count+1
	end
	for i in collect(1:size(compartments,1))
		axarr[1,i][:set_title](compartments[i],fontsize=28)
	end

	count =1
	for i in (selectedSpecies)
		if(length(names[i])>5)
			fs = 14
		elseif(length(names[i])>10)
			fs = 16
		else
			fs = 24
		end
		axarr[count,1][:set_ylabel](replace(replace(names[i], ' ', '\n'),'-', '\n'),fontsize = fs,rotation=90)
		ax = gca()
		#yloc=plt[:MaxNLocator](maxticks)
		#ax[:yaxis][:set_major_locator](yloc)
		#plt[:locator_params](nbins = 4, axis = 'y')
		count = count+1
	end
	plt[:show]()
	#label master x and y axes
	f[:text](0.5, 0.04, "Time, in minutes", ha="center", va="center", fontsize=40)
	f[:text](0.06, 0.5, "Concentration (nM) \n", ha="center", va="center", rotation="vertical",fontsize=40)
	savefig("../figures/22_08_17PrettyMeanSelectedSpeciesLowerHR.png")
end
