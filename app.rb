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
    pp 'about to add '
    @state[:students] << Student.new(age: age, classroom: classroom, name: name, parent_permission: parent_permission)
  end

  def add_teacher(age:, specialize:, name: 'Unknown', parent_permission: true)
    @state[:teachers] << Teacher.new(age: age, specialize: specialize, name: name,
                                     parent_permission: parent_permission)
  end

  def collect_person_data(selection)
    person_data = { student: %w[name age classroom parent_permission],
                    teacher: %w[name age specialize] }

    args = {}
    person_data[selection].each do |prop|
      print "#{prop}: "
      args[prop.to_sym] = gets.chomp
    end
    args
  end

  def add_person
    print 'Do you want to create a student(1) or a teacher (2) '
    gets.chomp == '1' ? add_student(collect_person_data(:student)) : add_teacher(collect_person_data(:teacher))
  end

  def list_person_rentals(id)
    people = @state[:students] + @state[:teachers]
    return 'Invalid ID, check again!' unless people.any? { |person| person.id == id }

    (people.find { |person| person.id == id }).rentals
  end

  def app_ui
    puts 'Please choose an option by enter a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end


end
