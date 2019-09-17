class Curator

  attr_reader :photographs, :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find{|artist| artist.id == id}
  end

  def find_photograph_by_id(id)
    @photographs.find{|photo| photo.id == id}
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    artist_id_arr = @photographs.map do |photograph|
      photograph.artist_id
    end

    mult_artists = artist_id_arr.find_all do |artist_id|
      artist_id_arr.count(artist_id) > 1
    end

    answer = []
    @artists.each do |artist|
      if mult_artists.include?(artist.id)
        answer << artist
      end
    end
    answer
  end

end
