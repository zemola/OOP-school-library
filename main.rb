#!/usr/bin/env ruby
require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def start
    puts
    puts '              ****************My School Library****************              '
    puts '                      ==================================              '
    puts '                         Welcome to School Library!'
    loop do
      menu
      option = gets.chomp
      break if option == '7'

      option_output option
    end
    puts 'Thank you for using our system!'
  end

  def menu
    puts
    puts 'Please choose an option by entering a number between 1 to 7: '
    puts ' 1 - List all books'
    puts ' 2 - List all people'
    puts ' 3 - Create a person'
    puts ' 4 - Create a book'
    puts ' 5 - Create a rental'
    puts ' 6 - List all rental for given person id'
    puts ' 7 - Exit'
    puts '********************************************************'
  end

  def option_output(option)
    case option
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_rentals_by_person_id
    else
      puts 'Please enter a number between 1 and 7.'
    end
  end

  def list_all_books
    puts 'No books in the database! please add a book.' if @books.empty?
    @books.each { |book| puts "Title : #{book.title}, Author: #{book.author}" }
    sleep 0.5
  end

  def list_all_people
    puts 'No people in the database! Please add a person.' if @people.empty?
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    sleep 0.5
  end

  def create_person
    print 'Would you like to create a student(1) or a teacher(2) [please input a number]: '
    option = gets.chomp

    case option
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid input. please input 1 or 2'
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print. 'Has parent permission? [Y/N]: '
    _parent_permission = gets.chomp.downcase

    student = Student.new(@class, age_std, name, parent_permission)
    @people << student

    puts 'Student created successfully'
    sleep 0.5
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, name, specialization)
    @people << teacher

    puts 'Teacher created successfully'
    sleep 0.5
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book

    puts 'Book added successfully'
    sleep 0.5
  end
end

def create_rental
  puts 'Select a book from the following list by number'
  @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

  book_id = gets.chomp.to_i

  puts 'Select a person from the following list by number (not id)'
  @people.each_with_index do |person, index|
    puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
  end

  person_id = gets.chomp.to_i

  print 'Date: '
  date = gets.chomp.to_s

  rental = Rental.new(date, @books[book_id], @people[person_id])
  @rentals << rental

  puts 'Rental created successfully'
  sleep 0.5
end

def list_rentals_by_person_id
  print 'ID of person: '
  id = gets.chomp.to_i

  puts 'Rentals:'
  @rentals.each do |rental|
    puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
  end
  sleep 0.5
end

def main
  app = App.new
  app.start
end

main
