require './person'
require './student'
require './book'
require './classroom'
require './teacher'
require './rental'

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
    option = get.chomp
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

