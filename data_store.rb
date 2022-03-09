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

  def load_books
    file = 'books.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def get_person_by_id(id)
    @people.each { |person| return person if person.id == id }
  end

  def get_book_by_title(title)
    @books.each { |book| return book if book.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |rental|
        date = rental['date']
        person = get_person_by_id(rental['person'])
        book = get_book_by_title(rental['book'])
        Rental.new(date, book, person)
      end
    else
      []
    end
  end

  def save_people
    data = []
    @people.each do |people|
      if people.instance_of?(Teacher)
        data.push({ key: 'teacher', id: people.id, age: people.age, name: people.name,
                    specialization: people.specialization })
      else
        data.push({ key: 'student', id: people.id, age: people.age, name: people.name,
                    permission: people.parent_permission, classroom: people.classroom })
      end
    end
    open('person.json', 'w') { |f| f.write JSON.generate(data) }
  end

  def save_rental
    data = []
    @rentals.each do |rental|
      data.push({ date: rental.date, person: rental.person.id, book: rental.book.title })
    end
    open('rentals.json', 'w') { |f| f << JSON.generate(data) }
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ title: book.title, author: book.author })
    end
    open('books.json', 'w') { |f| f << JSON.generate(data) }
  end
end
