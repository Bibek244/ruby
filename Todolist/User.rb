
require_relative 'Todolist'
class User 
 
   
    h = Todolist.new

    choice = true
    until choice == 5
        puts "********choose what to do***********"
        puts "1. Add task to todo list."
        puts "2. Display tasks in todo list."
        puts "3. Mark complete a task in todo list."
        puts "4. Delete task from todo list."
        puts "5. Exit."
        choice = gets.chomp.to_i
          case choice
            when 1
              puts "Enter task to do!!"
              todo = gets.chomp
              h.add_list(todo)
        
            when 2
              puts "********todo-list***********"
              puts "Current To-Do List:"
              h.display_list()
      
            when 3 
              puts "Enter a task id to mark as completed:"
              completed_task = gets.chomp.to_i
              h.complete_task(completed_task)
              puts "Updated To-Do List:"
              h.display_list
            when 4
              h.delete_task()
            else
              puts "please choose between 1 - 4"
      
          end

      end
     
end