class Rental
  attr_accessor :date
  attr_reader :book, :student

  def initialize(date:, book:, student:)
    @date = date

    @book = book
    book.rentals << self

    @student = student
    student.rentals << self
  end
end
