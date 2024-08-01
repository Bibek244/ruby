class Mastermind
  def initialize
    @colors = ["red", "blue", "white", "green", "black", "yellow", "pink", "brown"]
    @code_length = 4
    @max_attempts = 10
    @attempts = 0
    @guess_record = []
    @secret_code = generate_secret_code
  end

  def play
    puts "########################################################################################"
    puts "#                                   Mastermind                                         #"
    puts "########################################################################################"
    puts "Available colors: #{@colors}"
    puts "You have to guess the secret color sequence."
    puts "Guess the sequence of 4 colors to match the secret sequence to win the game!"
    
    until @attempts == @max_attempts
      puts "Your guess:"
      guess = gets.chomp.strip.split
      
      if !valid_guess?(guess)
        puts "Invalid colors or number of colors.\nPlease enter colors from the list above."
        next
      end
      
      @attempts += 1
      @guess_record.push(guess)
      
      display_attempts_remaining
      display_guess_record
      
      correct_position, correct_color = evaluate_guess(guess)
      
      puts "#{correct_position} colors are in the correct position."
      puts "#{correct_color} colors are correct in the sequence."
      
      if correct_position == @code_length
        puts "Congratulations, you have won the game!"
        return
      end
    end
    
    puts "You Lose!!!"
    puts "The secret sequence was #{@secret_code}"
  end

  private

  def generate_secret_code
    @colors.shuffle.take(@code_length)
  end

  def valid_guess?(guess)
    guess.length == @code_length && guess.all? { |color| @colors.include?(color) }
  end

  def display_attempts_remaining
    puts "#{@attempts}/#{@max_attempts} attempts left."
  end

  def display_guess_record
    puts "Previous guess record:"
    @guess_record.each { |row| puts row.join(' ') }
  end

  def evaluate_guess(guess)
    correct_position = guess.zip(@secret_code).count { |g, s| g == s }
    correct_color = @secret_code.uniq.sum { |c| guess.count(c) }
    correct_color -= correct_position
    [correct_position, correct_color]
  end
end

game = Mastermind.new
game.play
