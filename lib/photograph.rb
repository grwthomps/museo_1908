class Photograph

  attr_reader :id, :name, :artist_id, :year

  def initialize(attribute_hash)
    @id = attribute_hash[:id]
    @name = attribute_hash[:name]
    @artist_id = attribute_hash[:artist_id]
    @year = attribute_hash[:year]
  end

end
