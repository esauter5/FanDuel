list = [{player: "Chris Davis", salary: 12345, avg: 4},{player: "Manny Machado", salary: 2345, avg: 3},{player: "Mike Mussina", salary: 3245, avg: 2},
{player: "Joe Dirt", salary: 2210, avg: 5.5},{player: "Jane Doe", salary: 5345, avg: 2.5},{player: "Zach Sutton", salary: 13345, avg: 4.1},
{player: "Eric Sauter", salary: 8345, avg: 3},{player: "Adam Jones", salary: 1345, avg: 1.1},{player: "Chris Jones", salary: 2845, avg: 1.6},
{player: "John Denver", salary: 10345, avg: 3.5},{player: "Eirc Dickerson", salary: 10345, avg: 3.8},{player: "Rajai Smith", salary: 2345, avg: 1.5} ]

max_salary = 15000

actual_roster = []
total_avg = 0

player = {player: "test", salary: 0, avg: 0}

(0..11).each do |i|
	actual_roster << list[i]
	if list[i]
	(0..11).each do |j|
		next if i == j

	end
end

puts player[:player]