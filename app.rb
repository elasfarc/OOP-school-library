require_relative './student'

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
end

# x = App.new
# # pp x.state[:students]

# student1 = Student.new(age: 12, classroom: 'x', name: 'Al', parent_permission: true)
# puts student1
# # x.state[:students] << student1

# # puts x.list_people
