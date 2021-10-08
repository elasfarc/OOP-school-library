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
end
