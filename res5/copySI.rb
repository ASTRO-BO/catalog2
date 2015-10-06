load ENV["AGILE"] + "/scripts/conf.rb"

fout = File.new("cat2.res5", "w")

File.open("../cat2.res2").each_line do | line |
	l = line.split(" ")
	sname = l[0]
	si = "2.1"
	sierror = "0.0"
	
	File.open("resfull.si2.res").each_line do | line2 |
		l2 = line2.split(" ")
		if sname.chomp.to_s == l2[0].chomp.to_s
			si = l2[2]
			sierror = l2[3]
		end
	end
	cmd = l[0].to_s + " " + l[1].to_s + " " + l[2].to_s + " " + l[3].to_s + " " + l[4].to_s + " " + l[5].to_s + " " + l[6].to_s + " " + l[7].to_s + " " + si.to_s + " " + sierror.to_s + " " + l[10].to_s + " " + l[11].to_s + " " + l[12].to_s + " " + l[13].to_s + " " + l[14].to_s + " " + l[15].to_s + " " + l[16].to_s + " " + l[17].to_s + "\n"
	fout.write(cmd)
	
end
