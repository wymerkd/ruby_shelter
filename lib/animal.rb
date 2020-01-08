class Animal
  attr_accessor :name, :date, :gender, :type, :breed
  attr_reader :id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @date = attributes.fetch(:date)
    @gender = attributes.fetch(:gender)
    @type = attributes.fetch(:type)
    @breed = attributes.fetch(:breed)
  end
end
