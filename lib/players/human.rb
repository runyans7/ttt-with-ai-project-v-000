require_relative '../player.rb'

class Player::Human < Player

  def move(position)
    puts "Select a position. 1-9"
    input = gets.chomp
    input
  end

end