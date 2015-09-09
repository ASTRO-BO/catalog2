load ENV["AGILE"] + "/scripts/conf.rb"

datautils = DataUtils.new

system("mkdir img")

puts "<TABLE border=1>"
puts "<TH>Index</TH><TH>Source name</TH><TH>sqrt(TS)</TH><TH>l (center)</TH><TH>b (center)</TH><TH>counts</TH><TH>counts err.</TH><TH>flux</TH><TH>flux err</TH><TH>Spectral index</TH><TH>Spect. ind. err</TH><TH>l</TH><TH>b</TH><TH>R</TH><TH>a</TH><TH>b</TH><TH>phi</TH><TH>exp</TH><TH>ring</TH>"
index = 1
File.open("../cat2.res3").each_line do | line |
	l = line.split(" ");
	puts "<TR>"
	puts "<TD> <A href=img/" + l[0].to_s + ".png>" + index.to_s + "</A> <A href=img/" + l[0].to_s + "_fermi.png>LAT</A> </TS><TD>" + l[0] + "</TD><TD>" + l[1] + "</TD><TD>" + l[2] + "</TD><TD>" + l[3] + "</TD><TD>" + l[4] + "</TD><TD>" + l[5] + "</TD><TD>" + l[6] + "</TD><TD>" + l[7] + "</TD><TD>" + l[8] + "</TD><TD>" + l[9] + "</TD><TD>" + l[10] + "</TD><TD>" + l[11] + "</TD><TD>" + l[12] + "</TD><TD>" + l[13] + "</TD><TD>" + l[14] + "</TD><TD>" + l[15] + "</TD><TD>" + l[16] + "</TD><TD>" + l[17] + "</TD>"
	puts "</TR>"
	index = index + 1
	
	l1 = l[2]
	b1 = l[3]
	min = 9999
	dirmin = ""

	Dir["/results/results.agile/CAT2/CATALOG128_ASDCe_B01_I0023_FOVBINUMBER1_ENERGYBIN0/0*.*"].each do | dirs |
		dd = dirs.split("/")[5].to_s
		lc = dd.split(".")[0].to_f
		bc = dd.split(".")[1].to_f
		
		d = datautils.distance(lc, bc, l1, b1)
		#		puts l1.to_s + " " + b1.to_s + " " + lc.to_s + " " + bc.to_s + " " + d.to_s
		if d.to_f < min.to_f
			min = d
			dirmin = dirs
		end
	end


	cmd = "ds9 " + dirmin.to_s + "/FM3.119_ASDCe_I0023_B01.cts.gz  -zoom 4 -pan to " + l[2].to_s + " " + l[3].to_s + " wcs galactic -smooth radius 3 -smooth yes -cmap B -region /results/results.agile/CAT2/catalog2/cat2b_3.reg -grid yes -geometry 1024x1024 -saveimage png /results/results.agile/CAT2/catalog2/img/" + l[0].to_s + ".png -exit"
	#puts cmd
	#system(cmd)
	
	cmd = "ds9 " + dirmin.to_s + "/FM3.119_ASDCe_I0023_B01.cts.gz  -zoom 8 -pan to " + l[2].to_s + " " + l[3].to_s + " wcs galactic -smooth radius 3 -smooth yes -cmap B -region /results/results.agile/CAT2/catalog2/cat2b_3.reg -region /results/results.agile/CAT2/catalog2/3FGL/3FGL_gll_psc_v14_ell.reg -region /results/results.agile/CAT2/catalog2/3FGL/3FGL_gll_psc_v14.reg -grid yes -geometry 1024x1024 -saveimage png /results/results.agile/CAT2/catalog2/html/img/" + l[0].to_s + "_fermi.png -exit"
	#system(cmd)
end

puts "</TABLE>"




