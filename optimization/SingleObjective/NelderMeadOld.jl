using DataFrames
using Distances

function Rosenbrock(x)
	x1 = x[1]
	x2 = x[2]

	f = 100*(x2-x1^2)^2+(1-x1)^2
	return f
end

function NelderMead(f, x)
	#constants
	alpha = 1.0;
	gamma = .5;
	rho = .5;
	sigma = .5;
	tol = 1E-4

	df = DataFrame(x1 = Float64[], x2 = Float64[], x3 = Float64[]) #need to find way to create dataframe with n columns
	numdimensions = length(x[1,:])
	#calculate f(x)
	for j in range(1,size(x,1))
		Fofx = f(x[j,:])
		row = Float64[]
		for k in range(1,numdimensions)
			push!(row, x[j,k])
		end		
		completerow = [Fofx, row]
		push!(df, ([completerow]))
	end
	rename!(df, :x1, :Fofx)
	#sort f(x)
	sort!(df, cols = [:Fofx])
	xsorted = convert(Array, df[2:end])
	stdError = calculateStandardError(xsorted)
		if(stdError<tol)
			@show(stdError)
			@show(f(xsorted[1,:]))
			return xsorted[1,:]
		end


	#calculate centroid based on points 1 through n
	x0 = calculateCentroid(xsorted[1:end-1,:])
	xnplus1 = xsorted[end,:]
	xr = x0+alpha*(x0-xnplus1)

	@show xr
	x1 = xsorted[1,:]
	x2 = xsorted[2,:]
	xn = xsorted[end-1,:]

	fx1 = f(x1)
	fx2 = f(x2)
	fxr = f(xr)
	fxn = f(xn)

	#reflection
	if(fx1<= fxr && fxn>=fxr)
		xsorted[end,:] = xr
		NelderMead(f,xsorted)
	end
	#expansion
	if(fxr < fx1)
		xe = x0+gamma*(xr-x0)
		@show xe
		fxe = f(xe)
		if(fxe<fxr)
			xsorted[end,:] = xe
			NelderMead(f,xsorted)
		else
			xsorted[end,:]=xr
			NelderMead(f,xsorted)
		end
	#contraction
	else
		xc = x0+rho*(xnplus1-x0)
		@show xc
		fxc = f(xc)
		fnplus1 = f(xnplus1)
		if(fxc<fnplus1)
			xsorted[end,:] = xc
			NelderMead(f, xsorted)
		
		#shrink
		else
			println("made it into shrinkage")
			for q in range(2,size(xsorted,1)-1)
				xsorted[q,:] = x1+sigma*(xsorted[q,:]-x1)
			end
			NelderMead(f,xsorted)
		end
	end
	
	stdError = calculateStandardError(xsorted)
	
end


function calculateCentroid(x)
	numdimensions = length(x[1,:])
	numpoints = size(x,1)
	x0 = fill(1.0,1,numdimensions)
	for dim in range(1,numdimensions)
		x0[1,dim] = sum(x[:,dim])/numpoints
	end
	return x0
end

function calculateStandardError(x)
	numdimensions = length(x[1,:])
	numpoints = size(x,1)
	sum = 0.0
	xbar = fill(1.0,1,numdimensions)
	for dim in range(1,numdimensions)
		xbar[1,dim] = mean(x[:,dim])
	end
	for j in range(1,numpoints)
		sum = sum +evaluate(Euclidean(), xbar, x[j,:]) #calculate distance between xbar and current point and sum them
		
	end
	stdError = sqrt(sum)/numdimensions
	return stdError

end


function generateSimplex(x0)
	numdimensions = length(x0)
	simplex = fill(1.0, numdimensions+1,numdimensions)
	simplex[1,:] = x0
	@show simplex
	@show size(simplex)
	for k in range(2,numdimensions)
		row =x0 .+ squeeze(eye(numdimensions+1, numdimensions)[k-1,:],1) #add one to each point to make the simplex
		simplex[k,:] = row
	end
	return simplex
end

function runNelder_MeadForRosenbrock()
	x0 = [-1.2,1]
	x = generateSimplex(x0)
	Nelder_Mead(Rosenbrock,x,0)

end

runNelder_MeadForRosenbrock()
