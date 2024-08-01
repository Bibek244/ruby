
class Todolist
  def initialize
    @list = []
    @next_task_id = 1 
  end
  attr_accessor :list,:task_id
  def add_list(todo)
    @list.push({task_id: @next_task_id , task: todo, completed: false })
     @next_task_id  =  @next_task_id  +1
    puts "Task : '#{todo}' added"
    true
  end

  def complete_task(id)
    task = @list.find { |item| item[:task_id] == id }
    if task
      task[:completed] = true
      puts "Task '#{id}' marked as completed."
    else
      puts "Task '#{id}' not found."
    end
  end
  
  def delete_task()
    puts "Please enter id of task you want to delete?"
    id = gets.chomp.to_i
    task = @list.find { |item| item[:task_id] == id }
    if task
      @list.delete(task)
      puts "successfully delete"
    else
      puts "cannot find task in the list!"
    end
  end

  def display_list
    if @list.empty?
      puts "The to-do list is empty."
    else
      @list.each do |item|
        status = item[:completed] ? "completed" : "not completed"
        puts "Taskid: #{item[:task_id]} Task: #{item[:task]}, Status: #{status}"
      end
    end
  end
end
