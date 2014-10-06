# put the data set into an array in the file gen.dat
f = File.new("gen.dat", "r")
stockprices = f.readlines
f.close

# add sum of all of the data points
sum = 0
numberofdatapoints = 0
stockprices.each do |stockprice|
	sum = sum + stockprice.split(",")[1].to_f
	numberofdatapoints = numberofdatapoints + 1
end
mean = sum/numberofdatapoints

# output the standard deviation
a = []
stockprices.each do |stockprice|	
	difference = stockprice.to_f - mean
	avdifference = difference.abs
	a.push avdifference
	end

	#square all of the differences 
	b = []
	a.each do |differences|
		squared = differences**2
		b.push squared
	end

	# add all of the squared differences
	summ = 0
	c = []
	b.each do |thesum|
		summ = summ + thesum
	end

	# subtract 1 from number of original data points
	oneless = numberofdatapoints - 1

	# divide summ/oneless
	stepsix  = summ/oneless

	# find sqrt of stepsix
	standarddeviation = stepsix**0.5

# find the zscore of each number 
z = []
a.each do |zscore|
zvalue = zscore/standarddeviation
z.push zvalue.round(3)
end

# put the zscores in a new file called zscores.csv
f = File.new("zscores.csv", "w")
f.puts z.join("\n")
f.close

# put the data as the 0th element in the array and the zscores as the 1 element in the array

# "The standard deviation of the data is " +  standarddeviation.to_s 
# "The mean of the data is " + mean.to_s

nums = [3, 5, 8]
letters = ["a", "b", "c"]

nums.each.with_index do |num, i|
	letter = letters[i]
	puts i
end
