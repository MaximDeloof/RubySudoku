require_relative 'SudokuClass.rb'

puts "Enter the sudoku you want to solve ..."
sudoku = Sudoku.new
sudoku_given = gets
sudoku = convert_sudoku(sudoku_given)
result = sudoku.solve

if result == false
    puts " \n The sudoku has no solution"
elsif result == true
    puts "\nThe solved sudoku:"
    puts "\n"
    sudoku.print_roster
end


