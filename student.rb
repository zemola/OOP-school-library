require_relative './person'
require_relative './rental'

class Student < Person
  attr_accessor :classroom

  def initialize(_classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def owner=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
