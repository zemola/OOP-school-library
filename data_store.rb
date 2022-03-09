require 'json'
require_relative 'student'
require_relative 'rental'
require_relative 'book'
require_relative 'teacher'
require_relative 'classroom'

module DataStore
  def load_people
    if File.exist?('person.json')
      JSON.parse(File.read('person.json')).map do |people|
        if people['key'] == 'Teacher'
          teacher = Teacher.new(age: people['age'], id: people['id'], name: people['name'],
                                specialization: people['specialization'])
          teacher
        else
          parent_permission = people['permission'] && true
          student = Student.new(age: people['age'], id: people['id'], name: people['name'],
                                parent_permission: parent_permission, classroom: people['classroom'])
          student
        end
      end
    else
      []
    end
  end
end
