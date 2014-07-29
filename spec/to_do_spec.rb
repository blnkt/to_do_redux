require 'rspec'
require 'task'
require 'list'

describe Task do
  it "initializes a new task with a description" do
    new_task = Task.new("Stuff to do")
    expect(new_task).to be_an_instance_of Task
  end

  it "adds a due date to the task" do
    new_task = Task.new("Weed the garden")
    new_task.add_date("7/31")
    expect(new_task.date).to eq "7/31"
  end

  it "adds a priority level to the task" do
    new_task = Task.new("Weed the garden")
    new_task.add_date("7/31")
    new_task.add_priority("4")
    expect(new_task.priority).to eq "4"
  end

  it "edits the task description" do
    new_list = List.new("Test List")
    newest_task = Task.new("Wash the car")
    new_task = Task.new("Item One")
    other_task = Task.new("Item Two")
    new_list.add_task(new_task)
    new_list.add_task(other_task)
    new_list.add_task(newest_task)
    newest_task.edit_task("Wash the bike")
    expect(new_list.tasks[2].description).to eq "Wash the bike"
  end
end

describe List do
  it "initializes a new list with a title to add new tasks to" do
    new_list = List.new("List Title")
    expect(new_list).to be_an_instance_of List
  end

  it "adds a task to a list" do
    new_list = List.new("Test List")
    new_task = Task.new("Item One")
    new_list.add_task(new_task)
    expect(new_list.tasks[0].description).to eq "Item One"
  end

  it "remove a task from a list" do
    new_list = List.new("Test List")
    new_task = Task.new("Item One")
    other_task = Task.new("Item Two")
    new_list.add_task(new_task)
    new_list.add_task(other_task)
    new_list.remove_task(new_task)
    expect(new_list.tasks.length).to eq 1
    expect(new_list.completed_tasks.length).to eq 1
  end

  it "sorts tasks in a list by due date" do
    new_list = List.new("Dog Walking")
    clarence = Task.new("Walk Clarence")
    clarence.add_date("8/6")
    nacho = Task.new("Walk Nacho")
    nacho.add_date("8/30")
    rover = Task.new("Walk Rover")
    rover.add_date("8/2")
    new_list.add_task(clarence)
    new_list.add_task(nacho)
    new_list.add_task(rover)
    new_list.sort_by_date
    expect(new_list.tasks[0].description).to eq "Walk Rover"
    expect(new_list.tasks[1].description).to eq "Walk Clarence"
    expect(new_list.tasks[2].description).to eq "Walk Nacho"
  end

  it "sorts tasks in a list by due date" do
    new_list = List.new("Dog Walking")
    clarence = Task.new("Walk Clarence")
    clarence.add_date("7/6")
    nacho = Task.new("Walk Nacho")
    nacho.add_date("11/2")
    rover = Task.new("Walk Rover")
    rover.add_date("1/12")
    new_list.add_task(clarence)
    new_list.add_task(nacho)
    new_list.add_task(rover)
    new_list.sort_by_date
    expect(new_list.tasks[0].description).to eq "Walk Rover"
    expect(new_list.tasks[1].description).to eq "Walk Clarence"
    expect(new_list.tasks[2].description).to eq "Walk Nacho"
  end

  it"sorts tasks in a list by priority" do
    school = List.new("homework")
    problem_set = Task.new("problem set")
    problem_set.add_priority("3")
    term_paper = Task.new("term paper")
    term_paper.add_priority("5")
    poetry = Task.new("poetry assignment")
    poetry.add_priority("1")
    school.add_task(problem_set)
    school.add_task(term_paper)
    school.add_task(poetry)
    school.sort_by_priority
    expect(school.tasks[0].description).to eq "term paper"
    expect(school.tasks[1].description).to eq "problem set"
    expect(school.tasks[2].description).to eq "poetry assignment"
  end
end
