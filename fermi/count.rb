ts1c = 0
ts2c = 0
ts12c = 0
File.open("raw2.txt").each_line do | line |
	l = line.split(",")
	ts1 = l[8].to_f
	ts2 = l[12].to_f
	if(ts1 > 4)
		ts1c = ts1c + 1
	end
	if(ts2 > 4)
		ts2c = ts2c + 1
	end
	if(ts1 > 4 and ts2 > 4)
		ts12c = ts12c + 1
	end
end
puts (ts1c/3033.to_f).to_s
puts ts2c
puts (ts12c/303.3.to_f).to_s
	
