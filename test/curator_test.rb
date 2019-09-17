require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/artist'
require './lib/photograph'

class CuratorTest < Minitest::Test

  def setup
    @curator = Curator.new
    @photo_1 = Photograph.new({
         id: "1",
         name: "Rue Mouffetard, Paris (Boy with Bottles)",
         artist_id: "1",
         year: "1954"
    })
    @photo_2 = Photograph.new({
         id: "2",
         name: "Moonrise, Hernandez",
         artist_id: "2",
         year: "1941"
    })
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_initialization
    assert_equal [], @curator.photographs
  end

  def test_adding_photos
    @curator.add_photograph(@photo_1)
    assert_equal [@photo_1], @curator.photographs
    @curator.add_photograph(@photo_2)
    assert_equal [@photo_1, @photo_2], @curator.photographs
  end

end
