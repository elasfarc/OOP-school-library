class App
  attr_reader :state

  def initialize
    @state = { students: [], teachers: [], books: [] }
  end
end
