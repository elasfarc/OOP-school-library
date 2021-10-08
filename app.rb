require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'

class App
  attr_reader :state

  def initialize
    @state = { students: [], teachers: [], books: [] }
  end

  def run
    puts 'Welcome to School Library App!'
    running = true
    while running
      app_ui
      user_selection = gets.chomp.to_i
      case user_selection
      when 1
        puts list_books
      when 2
        puts list_people
      when 3
        add_person
      when 4
        add_book(collect_data(:book))
      when 5
        puts adding_rental_helper
      when 6
        print 'ID of the person: '
        puts list_person_rentals(gets.chomp.to_i)
      when 7
        running = false
      else
        puts 'Invalid selection, try again!'
      end
    end
  end

  private

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

  def collect_data(selection)
    req_data = { student: %w[name age classroom parent_permission],
                 teacher: %w[name age specialize],
                 book: %w[title author] }

    args = {}
    req_data[selection].each do |prop|
      print "#{prop}: "
      args[prop.to_sym] = gets.chomp
    end
    args
  end

  def add_person
    print 'Do you want to create a student(1) or a teacher (2) '
    gets.chomp == '1' ? add_student(collect_data(:student)) : add_teacher(collect_data(:teacher))
  end

  def adding_rental_helper
    people = @state[:students] + @state[:teachers]
    books = @state[:books]
    return 'no enough data' if books.length.zero? || people.length.zero?

    puts 'Select a book from the following list by a number'
    list_books.each_with_index { |book, i| puts "#{i}) #{book}" }
    book = books[gets.chomp.to_i]
    puts 'Select a person from the following list by a number (not ID) '
    list_people.each_with_index { |person, i| puts "#{i}) #{person}" }

    person = people[gets.chomp.to_i]
    puts 'Date'
    date = gets.chomp
    Rental.new(date: date, person: person, book: book)
    "\n ****rental creaded!***** \n"
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
