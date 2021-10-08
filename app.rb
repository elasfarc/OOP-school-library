require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  attr_reader :state

  def initialize
    @state = { students: [], teachers: [], books: [] }
  end

  def list_people
    people = @state[:students] + @state[:teachers]
    people.map { |person| "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age} " }
  end

  def list_books
    @state[:books].map { |book| "Title: #{book.title}, Author: #{book.author}" }
  end

  def add_book(title:, author:)
    @state[:books] << Book.new(title: title, author: author)
  end

  def add_student(age:, classroom:, name: 'Unknown', parent_permission: true)
    @state[:students] << Student.new(age: age, classroom: classroom, name: name, parent_permission: parent_permission)
  end

  def add_teacher(age:, specialize:, name: 'Unknown', parent_permission: true)
    @state[:teachers] << Teacher.new(age: age, specialize: specialize, name: name,
                                     parent_permission: parent_permission)
  end

  def list_person_rentals(id)
    people = @state[:students] + @state[:teachers]
    return 'Invalid ID, check again!' unless people.any? { |person| person.id == id }

    (people.find { |person| person.id == id }).rentals
  end
end
