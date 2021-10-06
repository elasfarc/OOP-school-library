class Corrector
  def correct_name(name:)
    name = name.strip[0..10] if name.length > 10
    name.capitalize
  end
end
