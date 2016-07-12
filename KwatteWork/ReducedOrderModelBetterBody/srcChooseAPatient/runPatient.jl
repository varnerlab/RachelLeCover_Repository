include("runModel.jl")
include("plotcomparisonNoLabels.jl")

function runPatient(patientID)
	savestr = string("outputJul12/", patientID)
	datasource = string("/home/rachel/Documents/modelingHR/LinkedRecordsTimeData10min/", patientID)
	runModel(savestr,datasource)
	plotcomparison(savestr)
end
