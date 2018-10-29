@students = []

def interactive_menu
  students = []
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students".center(70)
  puts "2. Show the students".center(70)
  puts "3. Save the list to students.csv".center(70)
  puts "4. Load the list from students.csv".center(70)
  puts "9. Exit".center(70)
end

def show_students
  print_header
  print_students_list
  print_footer(@students)
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def input_students
  puts "Please enter the name of the student: "
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the next student: "
    name = STDIN.gets.chomp
  end

  @students

end

def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(70)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(70)
end

interactive_menu
@students = input_students
print_header
print(students)
print_footer(students)
