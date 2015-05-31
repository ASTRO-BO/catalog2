File.open(ARGV[0]).each_line do | line |
	l = line.split(" ")
	#if l[1].to_f > 3.9 and (l[3].to_f < 10 and l[3].to_f > -10)
	if l[1].to_f > 3.9 and (l[3].to_f >= 10)
		puts line
	end
end
