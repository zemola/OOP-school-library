require_relative 'person'
require_relative 'student'
class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase

    student = Student.new(@class, age, name, parent_permission)
    @people << student

    puts 'Student created successfully'
    sleep 0.5
  end
