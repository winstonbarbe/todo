require 'date'

class Task
  attr_reader :name, :due_date, :completed

  def initialize(name)
    # Complete this method!
    @name = name
    @completed = false
  end

  def complete!
    # Complete this method!
    @completed = true
  end

  def set_due_date(month, day, year)
    # Complete this method!
    @due_date = Date.new(year, month, day)
  end

  def overdue?
    # Complete this method!
    @due_date && Date.today > @due_date && !@completed
  end

  def friendly_due_date
    # Complete this method!
    if !@due_date
      'NO DUE DATE'
    else
      @due_date.strftime("%b %d, %Y")
    end
  end

end