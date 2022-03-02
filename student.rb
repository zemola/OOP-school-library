require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'unkown', parent_permission: true)
    super(age, name = 'unkown', parent_permission: true)
    @classroom = classroom
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
