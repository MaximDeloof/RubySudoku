require_relative 'SudokuClass.rb'

a = convert_sudoku(".93..58..1..8.......692.5..4..3..7...8.7.2.5...9..8..6..8.316.......4..8..25..94.")
b = convert_sudoku("8...2...4...9.6.....7.5.6...5.....6.1.6.3.2.8.4.....5...9.7.3.....2.4...2...6...7")
c = convert_sudoku("8.......7..27.83...7..9..4..4..7..9...86.51...1..3..5..8..4..2...35.94..5.......1")
d = convert_sudoku("5..3.84....6.9..7.81.6.....7.8...1...5.....9...1...3.4.....5.32.7..3.8....32....6")
e = convert_sudoku("..53.....8......2..7..1.5..4....53...1..7...6..32...8..6.5....9..4....3......97..")

start_a = Time.now
a.solve
finish_a = Time.now

start_b = Time.now
b.solve
finish_b = Time.now

start_c = Time.now
c.solve
finish_c = Time.now

start_d = Time.now
d.solve
finish_d = Time.now

start_e = Time.now
e.solve
finish_e = Time.now

a.print_roster
puts "Roster a: ",(finish_a - start_a)%60, "\n"
b.print_roster
puts "Roster b: ",(finish_b - start_b)%60, "\n"
c.print_roster
puts "Roster c: ",(finish_c - start_c)%60, "\n"
d.print_roster
puts "Roster d: ",(finish_d - start_d)%60, "\n"
e.print_roster
puts "Roster e: ",(finish_e - start_e)%60, "\n"