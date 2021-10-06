class Corrector
  def initialize(name:)
    @name = name
  end

  def correct_name
    @name = @name.strip[0..10] if @name.length > 10
    @name = @name.capitalize
  end
end
