require_relative './corrector'

class Person
  attr_reader :rentals, :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = rand
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(name: @name)
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  private

  def of_age?
    age >= 18
  end
end

x = Person.new(name: 'abdelgahnykjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkj', age: 50)
x.validate_name
pp x.name
