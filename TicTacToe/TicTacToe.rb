module TicTacToe
  LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  class Game
    def initialize
      @board = Array.new(10)
      @current_player = 'x'
    end

    attr_reader :board

    def print_board
      col_separator, row_separator = " | ", "--+---+--"
      label_for_position = lambda{|position| @board[position] ? @board[position] : position}
      row_for_display = lambda{|row| row.map(&label_for_position).join(col_separator)}
      row_positions = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      rows_for_display = row_positions.map(&row_for_display)
      puts rows_for_display.join("\n" + row_separator + "\n")
    end

    def place_marker
      puts "Where do you want to put your marker?"
      marker = gets.chomp.to_i
      if marker.between?(1, 9)
        if @board[marker].nil?
          @board[marker] = @current_player
        else
          puts "Cannot place marker because position is already occupied"
          return false
        end
      else
        puts "Marker can only be placed in positions 1 - 9"
        return false
      end
      true
    end

    def switch_players
      @current_player = @current_player == 'x' ? 'o' : 'x'
    end

    def game_won?
      LINES.any? do |line|
        line.all? { |position| @board[position] == @current_player }
      end
    end

    def game_draw?
      (1..9).none? { |position| @board[position].nil? }
    end

    def play
      loop do
        print_board
        puts "Current player: #{@current_player}"

        next unless place_marker
        if game_won?
          print_board
          puts "Game won by #{@current_player}"
          break
        elsif game_draw?
          print_board
          puts "Game has ended in a draw!"
          break
        end
        switch_players
      end
    end
  end
end

game = TicTacToe::Game.new
game.play
