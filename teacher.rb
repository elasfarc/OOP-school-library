require_relative './person'

class Teacher < Person
  def initialize(age:, specialize:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialize
  end

  def can_use_services?
    true
  end
end
