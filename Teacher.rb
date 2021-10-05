require_relative "./Person.rb"

class Teacher < Person
  def initialize(name:'Unknown', age:, parent_permission: true, specialization: )
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end
end
