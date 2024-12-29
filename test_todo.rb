require_relative 'task.rb'
require_relative 'list.rb'

# # Tests for class Task:

# # Test 1
puts "TEST 1: Test that new task has name"
task = Task.new("Mow lawn")
if task.name == "Mow lawn"
  puts "TEST #1 passed"
else
  puts "TEST #1 failed"
end

# # Test 2
# puts
# puts "TEST 2: Test that the method #complete! should set task's complete attribute to true:"
# task = Task.new("Mow lawn")
# task.complete!
# if task.completed == true
#   puts "TEST #2 passed"
# else
#   puts "TEST #2 failed"
# end

# # Test 3
# puts
# puts "TEST 3: Test that the method #set_due_date should set task's due date to be the correct Date object"
# task = Task.new("Mow lawn")
# task.set_due_date(5, 22, 2022)
# if task.due_date == Date.new(2022, 5, 22)
#   puts "TEST #3 passed"
# else
#   puts "TEST #3 failed"
# end

# # Test 4
# puts
# puts "TEST 4: The #overdue? method should return true if the task has not completed AND has a due date AND the current day is past the due date"
# task = Task.new("Mow lawn")
# task.set_due_date(1, 19, 1985)
# if task.overdue?
#   puts "TEST #4 passed"
# else
#   puts "TEST #4 failed"
# end

# # Test 5
# puts
# puts "TEST 5: The #overdue? method should return false if the task has been completed no matter what the due date is:"
# task = Task.new("Mow lawn")
# task.set_due_date(1, 19, 1985)
# task.complete!
# if !task.overdue?
#   puts "TEST #5 passed"
# else
#   puts "TEST #5 failed"
# end

# # Test 6
# puts
# puts "TEST 6: The #overdue? method should return false if the task has has no due date:"
# task = Task.new("Mow lawn")
# if !task.overdue?
#   puts "TEST #6 passed"
# else
#   puts "TEST #6 failed"
# end

# # Test 7
# puts
# puts "TEST 7: The #friendly_due_date method should return the string 'NO DUE DATE' if the task has no due date:"
# task = Task.new("Mow lawn")
# if task.friendly_due_date == "NO DUE DATE"
#   puts "TEST #7 passed"
# else
#   puts "TEST #7 failed"
# end

# # Test 8
# puts
# puts "TEST 8: If the task has a due date, the #friendly_due_date method should return the string according to the strftime('%b %d, %Y') format"
# task = Task.new("Mow lawn")
# task.set_due_date(5, 22, 2022)
# if task.friendly_due_date == Date.new(2022, 5, 22).strftime("%b %d, %Y")
#   puts "TEST #8 passed"
# else
#   puts "TEST #8 failed"
# end

# # # Tests for class List:

# # Test 9
# puts
# puts "TEST 9: Test that new list has a name"
# list = List.new("House Chores")
# if list.name == "House Chores"
#   puts "TEST #9 passed"
# else
#   puts "TEST #9 failed"
# end

# # Test 10
# puts
# puts "TEST 10: Test that new list has an empty array of tasks by default"
# list = List.new("House Chores")
# if list.tasks == []
#   puts "TEST #10 passed"
# else
#   puts "TEST #10 failed"
# end

# # Test 11
# puts
# puts "TEST 11: Test that #add_task adds new task to the list, and that the task has the correct name"
# list = List.new("House Chores")
# list.add_task("Mow lawn")
# if list.tasks[0].is_a?(Task) && list.tasks[0].name == "Mow lawn"
#   puts "TEST #11 passed"
# else
#   puts "TEST #11 failed"
# end

# # Test 12
# puts
# puts "TEST 12: Test that #incomplete_tasks method returns an array of all the incomplete tasks from the list:"
# list = List.new("House Chores")
# list.add_task("Mow lawn")
# list.add_task("Clean laundry")
# list.add_task("Feed alligator")
# list.tasks[1].complete! # Complete the clean laundry task
# incomplete_tasks = list.incomplete_tasks
# if incomplete_tasks.length == 2 && incomplete_tasks[0].name == "Mow lawn" && incomplete_tasks[1].name == "Feed alligator"
#   puts "TEST #12 passed"
# else
#   puts "TEST #12 failed"
# end

# # Test 13
# puts
# puts "TEST 13: Test that #sorted_by_due_date method returns an array of all the tasks in order from oldest date to newest date:"
# list = List.new("House Chores")
# list.add_task("Mow lawn")
# list.add_task("Clean laundry")
# list.add_task("Feed alligator")
# list.tasks[0].set_due_date(5, 10, 2022)
# list.tasks[1].set_due_date(7, 16, 2022)
# list.tasks[2].set_due_date(3, 30, 2022)
# sorted_tasks = list.sorted_by_due_date
# if sorted_tasks[0].name == "Feed alligator" && sorted_tasks[1].name == "Mow lawn" && sorted_tasks[2].name == "Clean laundry"
#   puts "TEST #13 passed"
# else
#   puts "TEST #13 failed"
# end

# # Test 14
# puts
# puts "TEST 14: Test that #sorted_by_due_date method returns an array of all the tasks in order from oldest date to newest date - and puts all tasks without a due date and the end of the array:"
# list = List.new("House Chores")
# list.add_task("Mow lawn")
# list.add_task("Clean laundry")
# list.add_task("Feed alligator")
# list.tasks[1].set_due_date(7, 16, 2022)
# list.tasks[2].set_due_date(3, 30, 2022)
# sorted_tasks = list.sorted_by_due_date
# if sorted_tasks[0].name == "Feed alligator" && sorted_tasks[1].name == "Clean laundry" && sorted_tasks[2].name == "Mow lawn"
#   puts "TEST #14 passed"
# else
#   puts "TEST #14 failed"
# end