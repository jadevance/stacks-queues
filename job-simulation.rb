require_relative './Stack.rb'
require_relative './Queue.rb'

waiting_workers = Queue.new
workers = Stack.new

10.times do |worker|
	waiting_workers.enqueue(worker + 1)
end
p waiting_workers

6.times do 
	workers.push(waiting_workers.dequeue)
end 

p waiting_workers
p workers

evil_boss_roulette = 1 + rand(6)
p evil_boss_roulette

evil_boss_roulette.times do 
	waiting_workers.enqueue(workers.pop)
end

evil_boss_roulette.times do 
	workers.push(waiting_workers.dequeue)
end
p workers
p waiting_workers


# A company has six hiring positions with more people wanting jobs than the number of 
# available positions. The company managers decide in order to give more people 
# an opportunity to make money; they will allow people to work in three-month intervals. 
# The first six people on the waiting list will be hired in the order that they are on the 
# waiting list.  The first six people will keep these positions for three months.  
# At the end of three months, the manager will roll a dice to determine the number of 
# people who will lose their jobs. The company will use the policy of last-hired-first-fired.  
# For example, if the dice roll is 3, the last 3 people hired will lose their jobs to the first 3 
# people on the waiting list. People losing their jobs will be placed on the back of the waiting 
# list in the order that they are fired. This process will continue for every three-month interval.
