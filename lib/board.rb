class Board

  attr_accessor :cells, :counter

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def reset!
    self.cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} " 
  end

  def position(cell)
    cells[cell.to_i - 1]
  end

  def full?
    cells.all? { |position| position == "X" || position == "O" }
  end

  def turn_count
    counter = 0
    cells.each do |cell|
      if cell == "X" || cell == "O"
        counter += 1
      end
    end
    counter
  end

  def taken?(position)
    cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token
  end

end