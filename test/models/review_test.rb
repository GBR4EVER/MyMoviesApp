require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @movie = Movie.create(moviename: "Batman", genre: "Action")
    @review = @movie.reviews.new(author: "Joe Schmo", summary: "this is the best movie ever", 
              description: "A man walks into a terrible scenario.", email: "testemail@example.com")
  end
  
  test "review should be valid" do
    assert @review.valid?
  end
  
  test "chef_id should be present" do
    @review.movie_id = nil
    assert_not @review.valid?
  end
  
  test "author should be present" do
    @review.author = " "
    assert_not @review.valid?
  end
  
  test "author length should not be too short" do
    @review.author = "a" * 101
    assert_not @review.valid?
  end
  
  test "author length should not be too long" do
    @review.author = "a" * 4
    assert_not @review.valid?
  end
  
  test "summary must be present" do
    @review.summary = " "
    assert_not @review.valid?
  end
  
  test "summary length should not be too long" do
    @review.summary = "b" * 201
    assert_not @review.valid?
  end
  
  test "summary length should not be too short" do
    @review.summary = "b" * 9
    assert_not @review.valid?
  end
  
  test "description must be present" do
    @review.description = " "
    assert_not @review.valid?
  end
  
  test "description length should not be too long" do
    @review.description = "c" * 501
    assert_not @review.valid?
  end
  
  test "description length should not be too short" do
    @review.description = "c" * 19
    assert_not @review.valid?
  end
  
  test "email must be present" do
    @review.email = " "
    assert_not @review.valid?
  end
  
  test "email length should be within boumds" do
    @review.email = "a" * 101 + "@example.com"
    assert_not @review.valid?
  end
  
  test "email should be unique" do
    dup_review = @review.dup
    dup_review_email = @review.email.upcase
    @review.save
    assert_not dup_review.valid?
  end
  
  test "email validation should accept valid email addresses" do
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.au laura+joe@monk.cm]
    valid_addresses.each do |va|
      @review.email = va
      assert @review.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid email addresses" do
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @review.email = ia
      assert_not @review.valid?, '#{ia.inspect} should be invalid'
    end
  end
  
end