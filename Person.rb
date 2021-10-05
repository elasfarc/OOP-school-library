class Person
  def initialize(name:'Unknown', age:, parent_permission: true)
    @id
    @name = name
    @age = age
  end

  attr_reader :id
  attr_accessor :name, :age

  private_class_method :is_of_age
  def is_of_age?
    self.age >= 18 
  end
end
