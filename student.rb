require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
