require_relative '../teacher'

describe Teacher do
  context 'When providing teacher information' do
    teacher = Teacher.new(age: 25, specialization: 'Math')

    it 'Creates a new teacher with an age of 25 and a specialization of math' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'the permission should always have permission to use services' do
      expect(teacher.can_use_services?).to eq true
    end
  end
end
