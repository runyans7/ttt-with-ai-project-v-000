require "pry"

class Game

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def over?
    board.full?
  end

  def won?
    WIN_COMBINATIONS.each do |line|
      return line if line.all? { |position| board.cells[position] == "X" }
      return line if line.all? { |position| board.cells[position] == "O" }
    end
    false
  end

  def draw?
    over? && !won?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def turn
    cell = current_player.move(board)

    if board.valid_move?(cell)
      board.update(cell, current_player)
    else
      puts "Please enter a valid square"
      turn
    end

  end

  def play
    board.display
    until won? || draw?
      turn
      system "clear"
      board.display
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end