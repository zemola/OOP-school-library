require './corrector'
require './rental'

class Person
  attr_reader :id
  attr_accessor :name, :age, :rental, :parent_permission

  def initialize(age = 22, name = 'John Doe', parent_permission = 1)
    @id = Random.rand(1..2000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rental = []
  end

  def add_rental(book, date)
    Rental.new(book, date, self)
  end

  private

  def ofage?
    return true unless age < 18
  end

  public

  def use_services?
    return true if ofage? || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end
end
