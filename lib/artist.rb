class Artist

  attr_reader :id, :name, :born, :died, :country

  def initialize(attribute_hash)
    @id = attribute_hash[:id]
    @name = attribute_hash[:name]
    @born = attribute_hash[:born]
    @died = attribute_hash[:died]
    @country = attribute_hash[:country]
  end

end
