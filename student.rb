require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, _name = 'unknown', _parent_permission: true)
    super(age, _name = 'unknown', _parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
