def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end
end



def input_students
  puts "Please enter the name of the student: "

  students = []

  name = gets.chomp

  puts "Please enter the student's country of birth: "
  country = gets.chomp

  puts "Please enter the student's date of birth: "
  dob = gets.chomp

  while !name.empty? do
    students << {name: name, country: country, dob: dob, cohort: :november}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the next student: "
    name = gets.chomp
    puts "Please enter the student's country of birth: "
    country = gets.chomp
    puts "Please enter the student's date of birth: "
    dob = gets.chomp
  end

  students

end

def print_header
  puts "The students of Villains Academy".center(150)
  puts "-------------".center(150)
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (Nationality: #{:country} DOB: #{:dob} #{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  if names.count == 1
    puts
  puts "Overall, we have #{names.count} great students"
  end
end

interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
