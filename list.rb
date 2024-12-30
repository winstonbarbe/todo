class List
  attr_reader :name, :tasks

  def initialize(name)
    # Complete this method!
    @name = name
    @tasks = []
    @incomplete_tasks = []
  end

  def add_task(name)
    # Complete this method!
    task = Task.new(name)
    @tasks << task
  end

  def incomplete_tasks
    # Complete this method!
    @tasks.each do |task|
      @incomplete_tasks << task unless task.completed
    end
    @incomplete_tasks
    
  end

  def sorted_by_due_date
    # Complete this method!
    tasks_with_due_dates = []
    tasks_without_due_dates = []
    @tasks.each do |task|
      if task.due_date
        tasks_with_due_dates << task
      else
        tasks_without_due_dates << task
      end
    end
    sorted_tasks = tasks_with_due_dates.sort_by { |task| task.due_date}
    sorted_tasks + tasks_without_due_dates
  end
end