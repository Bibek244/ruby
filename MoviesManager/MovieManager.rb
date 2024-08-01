class MovieManager
  def initialize
    @movies = {
      Intestellar: "4",
      Godfather: "4",
      inception: "3.5",
    }
  end

  def add
    puts "Movie name you want to add?"
    title = gets.chomp
    if @movies[title.to_sym].nil?
      puts "Rating for the movie?"
      rating = gets.chomp
      check_rating_error(rating) && return 
      @movies[title.to_sym] = rating
      puts "Added movie to the list"
    else
      puts "Movie already in the list"
    end
  end

  def update
    puts "Name of movie you want to update?"
    title = gets.chomp
    if @movies[title.to_sym].nil?
      puts "Error: movie you chose doesn't exist in the list"
    else
      puts "Updated rating"
      rating = gets.chomp
      check_rating_error(rating) && return 
      @movies[title.to_sym] = rating
      puts "Successfully updated"
    end
  end

  def display
    @movies.each do |movie, rating|
      puts "#{movie}: #{rating}"
    end
  end

  def delete
    puts "Name of movie you want to delete?"
    title = gets.chomp
    if @movies[title.to_sym]
      @movies.delete(title.to_sym)
      puts "Successfully deleted"
    else
      puts "Cannot find movie in the list!"
    end
  end

  def check_rating_error(rating)
   if rating.to_i < 0 || rating.to_i > 5 
    puts "Rating system is suppose to be 0 - 5."
    return true
   else 
    return false
   end
  end

  def main
    choice = nil
    until choice == "end"
      puts "What do you like to do?"
      puts "To add movies type 'add'"
      puts "To display movies type 'display'"
      puts "To delete movies type 'delete'"
      puts "To update movies type 'update'"
      puts "To end this session type 'end'"
      choice = gets.chomp.downcase
      
      case choice
      when "add"
        add
      when "update"
        update
      when "display"
        display
      when "delete"
        delete
      when "end"
        puts "Ending session..."
      else
        puts "Error! Please choose a valid option."
      end
    end
  end
end

manager = MovieManager.new
manager.main
