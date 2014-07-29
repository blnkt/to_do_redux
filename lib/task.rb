class Task
  def initialize(description)
    @description = description
  end
  def description
    @description
  end
  def add_date (date)
    @date = date
  end
  def date
    @date
  end
  def add_priority(priority)
    @priority = priority
  end
  def priority
    @priority
  end
  def edit_task(new_description)
    @description = new_description
  end
end
