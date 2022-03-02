require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, _name = 'unkown', _parent_permission: true)
    super(age, _name = 'unkown', _parent_permission: true)
    @classroom = classroom
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
