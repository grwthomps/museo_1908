class Curator

  attr_reader :photographs, :artists, :imported_photographs, :imported_artists

  def initialize
    @photographs = []
    @artists = []
    @imported_photographs = []
    @imported_artists = []
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

    @artists.find_all do |artist|
      mult_artists.include?(artist.id)
    end
  end

  def photographs_taken_by_artist_from(country)
    artist_from_country = @artists.find_all{|artist| artist.country == country}

    photos = []
    @photographs.each do |photograph|
      artist_from_country.each do |artist|
        photos << photograph if photograph.artist_id == artist.id
      end
    end
    photos
  end

  def load_photographs(file_path)
    @imported_photographs = FileIO.load_photographs(file_path)
  end

  def load_artists(file_path)
    @imported_artists = FileIO.load_artists(file_path)
  end

  def photographs_taken_between(range)
    @imported_photographs.find_all do |photo|
      photo[:year].to_i.between?(range.first, range.last)
    end
  end

end
