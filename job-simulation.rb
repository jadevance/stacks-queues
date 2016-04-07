require_relative './Stack.rb'
require_relative './Queue.rb'

waiting_workers = Queue.new
workers = Stack.new

# scales for however many workers are on the list
10.times do |worker|
	waiting_workers.enqueue(worker + 1)
end

6.times do 
	workers.push(waiting_workers.dequeue)
end 

evil_boss_roulette = 1 + rand(6)

evil_boss_roulette.times do 
	waiting_workers.enqueue(workers.pop)
end

evil_boss_roulette.times do 
	workers.push(waiting_workers.dequeue)
end