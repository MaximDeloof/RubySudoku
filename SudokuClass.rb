class Sudoku < Array

  # Initialize new Sudoku object
  def initialize(roster=[])
    @roster = roster
  end

  #################
  # -- GETTERS -- #
  #################

  # Returns the index when given a position 
  def get_index(pos=[0, 0])
    return pos[0]*9+pos[1]
  end

  # Returns the position when given an index
  def get_pos(index)
    return [index/9, index%9]
  end

  # Returns the row when given the row number
  def get_row(row_number=0)
    return @roster.slice(9*row_number..9*(row_number+1)-1)
  end

  # Returns the column when given the column number
  def get_col(col_number=0)
    col = Array.new(9)
    for i in 0..8
      col[i] = @roster[i*9+col_number]
    end
    return col
  end

  # Returns the square belonging to a position
  def get_square(row,col)
    square = Array.new(9)
    square_number=(row/3)*3+(col/3)
    for i in 0..2
        square[i*3] = @roster[i*9+3*(square_number%3)+27*(square_number/3)]
        square[i*3+1] = @roster[i*9+3*(square_number%3)+27*(square_number/3)+1]
        square[i*3+2] = @roster[i*9+3*(square_number%3)+27*(square_number/3)+2]
    end
    return square
  end

  # Returns the entire roster
  def get_roster
    return @roster
  end

  # Prints the roster row by row
  def print_roster
    for i in 0..8
      print @roster.slice(i*9..i*9+8), "\n"
    end
    print "\n"
  end

  ##################
  # -- CHECKERS -- #
  ##################

  def solved?(work_array)
    work_array.each do |i|
      unless i.is_a?(Numeric)
        return false
      end
    end
    return true
  end

  def solvable?(work_roster)
    work_roster.each do |i|
      if i == []
        return false
      end
    end
    return true
  end

  ###################
  # -- FUNCTIONS -- #
  ###################

  # Calculates the possible values at a given position
  def calc_possibles(row, col)
    possibles = (1..9).to_a
    possibles = possibles - self.get_row(row)
    possibles = possibles - self.get_col(col)
    possibles = possibles - self.get_square(row,col)
    return possibles
  end

  # Create a roster with an array of possible values at every unknown position
  def make_possibles
    roster_possibles = @roster.dup
    for i in 0..80
      if roster_possibles[i] == nil
        roster_possibles[i] = calc_possibles(i/9,i%9)
      end
    end
    return roster_possibles
  end

  # Solve sudoku with recursion
  def solve
    work_roster = self.make_possibles
    initial_roster = @roster.dup
    if solved?(work_roster)
      return true
    elsif solvable?(work_roster) == false
      return false
    end
    shortest_arr_found = Array.new(10)
    shortest_pos_found = 0
    for i in 0..80
      curr_value = work_roster[i]
      if curr_value.is_a?(Array) && (curr_value.length < shortest_arr_found.length)
        shortest_arr_found = curr_value
        shortest_pos_found = i
      end
    end
    shortest_arr_found.each do |value|
      @roster[shortest_pos_found] = value
      result = self.solve
      if result == false
        @roster = initial_roster
        next
      elsif result == true
        return true
      end
    end
    @roster = initial_roster
    return false
  end
end

# Converts the Sudoku format from https://www.sudoku-solutions.com to a compatible one.
def convert_sudoku(sequence)
  sudoku = Sudoku.new
  sequence.split("")
  for i in 0..80
    value = sequence[i]
    if value == "."
      sudoku.get_roster[i] = nil
    else
      sudoku.get_roster[i] = value.to_i
    end
  end
  return sudoku
end