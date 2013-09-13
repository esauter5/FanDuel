require 'pry'

i = 1
names = []
avg_points = []
salary = []
positions = []
dl = false
position = ""

File.open("new_day.txt").readlines.each do |line|
	if i%3 == 1
		dl = false
		position = line.chop
	elsif i%3 == 2
		name = line.chop
		if name[name.length-2..name.length-1] != "DL"
			name = name[0..name.length-2] if name[name.length-1] == "P"
			names << name
			positions << position
		else
			dl = true
		end
	elsif i%3 == 0 && dl != true
		data = line.chop.split
		#binding.pry
		avg_points << data[0]
		salary << data[3][1..data[3].length-1].delete(',')
	end
	i = i+1
end


f = File.open('daily_players.txt', 'w')

(0..names.length-1).each do |i|
	f.write(names[i] + "," + avg_points[i] + "," + salary[i] + "," + positions[i]+ "\n")
end

f.close

pitchers = []
catchers = []
firsts = []
seconds = []
sss = []
thirds = []
of1s = []
of2s = []
of3s = []
contains = false

avg_points.map! {|num| num.to_f}
salary.map! {|num| num.to_i}

(0..names.length-1).each do |i|
	if avg_points[i] >= 1.7
		if positions[i] == "P"
			contains = false
			if pitchers != []
				pitchers.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				pitchers.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				pitchers.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i] }
				pitchers.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			pitchers << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "1B"
			contains = false
			if firsts != []
				firsts.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				firsts.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				firsts.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				firsts.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			firsts << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "2B"
			contains = false
			if seconds != []
				seconds.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				seconds.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				seconds.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				seconds.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			seconds << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "SS"
			contains = false
			if sss != []
				sss.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				sss.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				sss.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				sss.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			sss << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "3B"
			contains = false
			if thirds != []
				thirds.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				thirds.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				thirds.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				thirds.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			thirds << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "C"
			contains = false
			if catchers != []
				catchers.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				catchers.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				catchers.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				catchers.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			catchers << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		elsif positions[i] == "OF"
			contains = false
			if of1s != []
				of1s.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				of2s.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				of3s.delete_if { |p| p[:salary] == salary[i] && p[:points] < avg_points[i] }
				of1s.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				of2s.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				of3s.delete_if { |p| p[:salary] > salary[i] && p[:points] <= avg_points[i] }
				of1s.each { |p| contains = true if p[:salary] == salary[i] && p[:points] > avg_points[i]}
				of1s.each { |p| contains = true if p[:salary] < salary[i] && p[:points] >= avg_points[i]}
			end
			of1s << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
			of2s << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
			of3s << {name: names[i], points: avg_points[i], salary: salary[i], position: positions[i]} if contains == false
		end
	end
end

pitcher = {}
catcher = {}
first = {}
second = {}
ss = {}
third = {}
of1 = {}
of2 = {}
of3 = {}
total_salary0 = 0
total_salary1 = 0
total_salary2 = 0
total_salary3 = 0
total_salary4 = 0
total_salary5 = 0
total_salary6 = 0
total_salary7 = 0
total_salary8 = 0
total_salary9 = 0

total_points0 = 0
total_points1 = 0
total_points2 = 0
total_points3 = 0
total_points4 = 0
total_points5 = 0
total_points6 = 0
total_points7 = 0
total_points8 = 0
total_points9 = 0
max_points = 0
team = []
count = 0

	(0..pitchers.length-1).each do |a|
	total_salary = 0
	total_points = 0
	pitcher = pitchers[a]
	total_salary1 = total_salary0 + pitcher[:salary]
	total_points1 = total_points0 + pitcher[:points]
	(0..catchers.length-1).each do |b|
		catcher = catchers[b]
		total_salary2 = total_salary1 + catcher[:salary]
		total_points2 = total_points1 + catcher[:points]
		(0..firsts.length-1).each do |c|
			first = firsts[c]
			total_salary3 = total_salary2 + first[:salary]
			total_points3 = total_points2 + first[:points]
			(0..seconds.length-1).each do |d|
				second = seconds[d]
				next if total_salary3 + second[:salary] >= 35000
				total_salary4 = total_salary3 + second[:salary]
				total_points4 = total_points3 + second[:points]
				(0..sss.length-1).each do |e|
					ss = sss[e]
					next if total_salary4+ ss[:salary] >= 35000
					total_salary5 = total_salary4 + ss[:salary]
					total_points5 = total_points4 + ss[:points]
					(0..thirds.length-1).each do |f|
						third = thirds[f]
						next if total_salary5 + third[:salary] >= 35000
						total_salary6 = total_salary5 + third[:salary]
						total_points6 = total_points5 + third[:points]
						(0..of1s.length-1).each do |g|
							of1 = of1s[g]
							next if total_salary6 + of1[:salary] >= 35000
							total_salary7 = total_salary6 + of1[:salary]
							total_points7 = total_points6 + of1[:points]
							(0..of2s.length-1).each do |h|
								of2 = of2s[h]
								next if total_salary7 + of2[:salary] >= 35000 || of2[:name] == of1[:name]
								total_salary8 = total_salary7 + of2[:salary]
								total_points8 = total_points7 + of2[:points]
								(0..of3s.length-1).each do |i|
									of3 = of3s[i]
									next if total_salary8 + of3[:salary] > 35000 || of3[:name] == of2[:name] || of3[:name] == of1[:name]
									total_salary9 = total_salary8 + of3[:salary]
									total_points9 = total_points8 + of3[:points]
									if total_points9 >= max_points - 0.001
										max_points = total_points9
										team = [pitcher,catcher,first,second,ss,third,of1,of2,of3]
										puts max_points
										puts team
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

binding.pry


=begin
	(0..pitchers.length-1).each do |a|
	total_salary = 0
	total_points = 0
	pitcher = pitchers[a]
	total_salary = total_salary + pitcher[:salary]
	total_points = total_points + pitcher[:points]
	(0..catchers.length-1).each do |b|
		catcher = catchers[b]
		total_salary = total_salary + catcher[:salary]
		total_points = total_points + catcher[:points]
		(0..firsts.length-1).each do |c|
			first = firsts[c]
			total_salary = total_salary + first[:salary]
			total_points = total_points + first[:points]
			(0..seconds.length-1).each do |d|
				second = seconds[d]
				next if total_salary + second[:salary] > 35000
				total_salary = total_salary + second[:salary]
				total_points = total_points + second[:points]
				puts "(((("
				(0..sss.length-1).each do |e|
					ss = sss[e]
					next if total_salary + ss[:salary] > 35000
					total_salary = total_salary + ss[:salary]
					total_points = total_points + ss[:points]
					puts "!!!"
					(0..thirds.length-1).each do |f|
						third = thirds[f]
						next if total_salary + third[:salary] > 35000
						total_salary = total_salary + third[:salary]
						total_points = total_points + third[:points]
						(0..of1s.length-1).each do |g|
							of1 = of1s[g]
							next if total_salary + of1[:salary] > 35000
							total_salary = total_salary + of1[:salary]
							total_points = total_points + of1[:points]
							if max_points < total_points
								team = [pitcher, catcher, first,second,third,ss,of1]
								max_points = total_points
							end
						end
					end
				end
			end
		end
	end
end
=end
