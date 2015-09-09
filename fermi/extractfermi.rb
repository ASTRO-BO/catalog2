index = 0
out = ""
File.open("raw1.txt").each_line do | line |
	l = line.split(",")
	if l[0].to_i == (index.to_i + 1)
		puts index.to_s + " , " + out
		out = line.chomp
		index = index + 1
	else
		out = out + ", " + line.chomp
	end
	
end