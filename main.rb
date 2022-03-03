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
  end
end

