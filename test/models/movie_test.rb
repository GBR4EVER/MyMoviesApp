require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  
  def setup
    @movie = Movie.new(moviename: "Star Wars", genre: "Adventure")
  end
  
  test "movie should be valid" do
    assert @movie.valid?
  end
  
  test "moviename should be present" do
    @movie.moviename = " "
    assert_not @movie.valid?
  end
  
  test "moviename should not be too long" do
    @movie.moviename = "a" * 51
    assert_not @movie.valid?
  end
  
  test "moviename should not be too short" do
    @movie.moviename = "aa"
    assert_not @movie.valid?
  end
  
  test "genre should be present" do
    @movie.genre = " "
    assert_not @movie.valid?
  end
  
  test "genre should not be too short" do
    @movie.genre = "bb"
    assert_not @movie.valid?
  end
  
  test "genre should not be too long" do
    @movie.genre = "b" * 51
    assert_not @movie.valid?
  end
  
  test "moviename should be unique" do
    dup_movie = @movie.dup
    dup_movie_moviename = @movie.moviename.upcase
    @movie.save
    assert_not dup_movie.valid?
  end
  
  
end