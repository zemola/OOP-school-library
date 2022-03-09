require_relative 'app'
require 'json'

class Main
  def initialize
    @app = App.new
  end

  def run
    puts 'Welcome to School Library!'

    loop do
      menu

      option = gets.chomp

      break if option == '7'

      @app.get_num option
    end
    @app.save_people
    @app.save_books
    @app.save_rental
    puts 'Thank you for using this app!'
  end

  def menu
    puts
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
execute_app = Main.new
execute_app.run
