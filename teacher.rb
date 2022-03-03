require_relative './person'
require_relative './rental'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
