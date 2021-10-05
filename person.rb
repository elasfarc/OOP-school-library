class Person
  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    is_of_age? || @parent_permission
  end

  private

  def of_age?
    age >= 18
  end
end
