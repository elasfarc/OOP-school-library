require_relative "./Person.rb"

class Teacher < Person
  def initialize(name:'Unknown', age:, parent_permission: true, specialization: )
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end
  def can_use_services?
    true
  end
end





pp x = Teacher.new(age: 5, specialization: 'X', name: 'ali')
pp x.can_use_services?