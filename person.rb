require_relative './corrector'

class Person
  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = rand
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new(name: @name)
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = @corrector.correct_name
  end

  private

  def of_age?
    age >= 18
  end
end
