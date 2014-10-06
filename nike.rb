puts "Calculating Nike Stock Average, Standard Deviation, and Z score"

f = File.open("nike_stock.csv" , "a+")
info = f.readlines

i = 0
while i < info.length
	info[i] = info[i].split(",")
	i=i+1
end

i = 0
sum = 0
while i < info.length
	sum = info[i][1].tr('"','').to_f + sum
	i=i+1
end

mean = sum/info.length

puts"Average = " + mean.round(2).to_s

i = 0
sum1 = 0
while i < info.length
        sum1 = (info[i][1].tr('"','').to_f - mean)**2 + sum1
        i=i+1
end

dev = Math.sqrt(sum1/info.length - 1)

puts "Standard Deviation = " + dev.round(2).to_s

newf = File.open("nike_history.txt","a+")

i = 0
zscore = 0
while i < info.length
	zscore = (info[i][1].tr('"','').to_f - mean)/dev
	newf.write(info[i][1].tr('"','').to_f)
	newf.write("    ")
	newf.write(zscore)
	newf.write("    ")
	newf.write(mean)
	newf.write("    ")
	newf.write(dev)
	newf.write("\n")
	i=i+1
end

puts "zscore = " +  zscore.round(2).to_s

mid = (info.length.to_f/2)

median = info[mid][1].tr('"','').to_f

puts "Median = " + median.round(2).to_s
