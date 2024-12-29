require_relative 'task.rb'
require_relative 'list.rb'

class TodoApp
  def initialize
    @lists = []
  end

  def start
    print_welcome_screen
    run_main_menu_loop
  end

  def print_welcome_screen
    puts
    puts "***************************"
    puts "* Welcome to the TodoApp! *"
    puts "***************************"
    puts
  end

  def run_main_menu_loop
    while true
      display_list_menu_options

      # If you're not familiar with the Ruby "case" statement, go ahead and look it up!
      # It's just another way to write and if/elsif/else conditional statement, but looks cleaner
      # when there are many options to choose from.

      response = gets.chomp.upcase 

      case response
      when "C"
        create_new_list
      when "D"
        next
      when /^[0-9]*$/ # if response is a number
        list = @lists[response.to_i - 1] # in the display menu, lists start with at #1, but in the array they start at index 0
        run_task_menu_loop(list)
      end
    end
  end

  def display_list_menu_options
    if @lists.any?
      puts "Your lists:"
      print_items(@lists)
      puts "To select a list, enter its number. Or, choose from the other options:"
      puts "D - Display all list titles"
    else
      puts "Choose from the following options:"
    end

    puts "C - Create new list"
  end

  def create_new_list
    puts "Please enter the name of your new list:"
    list_name = gets.chomp
    @lists << List.new(list_name)

    puts "List created."
    puts
  end

  def run_task_menu_loop(list)
    while true
      display_task_menu_options(list)

      case gets.chomp.upcase
      when "T"
        create_task(list)
      when "I"
        display_incomplete_tasks(list)
      when "O"
        display_sorted_tasks(list)
      when "M"
        complete_task(list)
      when "D"
        due_date_form(list)
      when "L"
        break
      end
    end
  end

  def display_task_menu_options(list)
    puts "---------------------------"
    puts "List Name: #{list.name}"
    puts "---------------------------"
    puts "Tasks:"
    print_tasks(list.tasks)
    puts
    puts "Select one of the following options:"
    puts "T - Create new task"
    puts "I - Show only incomplete tasks"
    puts "M - Mark task as complete"
    puts "D - Set due date"
    puts "L - Return to lists menu"
    puts "O - Order of tasks by due date"
  end

  def create_task(list)
    puts "Enter task name:"
    task_name = gets.chomp
    list.add_task(task_name)
    puts 
    puts "Task added!"
    puts "Here is your updated list:"
    puts
  end

  def display_incomplete_tasks(list)
    puts "Incomplete tasks for list: #{list.name}"
    print_tasks(list.incomplete_tasks)
    puts
  end

  def display_sorted_tasks(list)
    puts "Tasks in order of due date:"
    print_tasks(list.sorted_by_due_date)
    puts
  end

  def complete_task(list)
    puts "To mark a task as complete, enter the task number:"
    response = gets.chomp
    if response.to_i != 0
      task_index = response.to_i - 1
      list.tasks[task_index].complete!
    end
  end

  def due_date_form(list)
    puts "To set a due date for a task, enter the task number:"
    response = gets.chomp
    if response.to_i != 0
      task_index = response.to_i - 1
    end
    puts "Please enter month number (1-12):"
    month = gets.chomp.to_i
    puts "Please enter day number (1-31):"
    day = gets.chomp.to_i
    puts "Please enter year (e.g. 2021):"
    year = gets.chomp.to_i
    list.tasks[task_index].set_due_date(month, day, year)
    puts "Due date set."
  end

  def print_items(items)
    print_horizontal_line(27)
    items.each_with_index do |item, index|
      puts "#{index + 1}: #{item.name}"
    end
    print_horizontal_line(27)
  end

  def print_tasks(tasks)
    print_horizontal_line(60)
    tasks.each_with_index do |task, index|
      row = ""
      task_number = index + 1
      spacing = " " * (15 - task.name.length)
      completed_status = task.completed ? "COMPLETED" : " " * 9
      due_date = task.friendly_due_date
      overdue_status = task.overdue? ? " - OVERDUE!" : ""
      puts "#{task_number}. #{task.name} #{spacing} | #{completed_status} | #{due_date} #{overdue_status}"
    end
    print_horizontal_line(60)
  end

  def print_horizontal_line(spaces)
    puts "*" * spaces
  end
end

TodoApp.new.start