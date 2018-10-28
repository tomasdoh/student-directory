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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (Nationality: #{:country} DOB: #{:dob} #{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
