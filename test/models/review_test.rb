require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @review = Review.new(author: "Joe Schmo", summary: "this is the best movie ever", 
              description: "A man walks into a terrible scenario.")
  end
  
  test "review should be valid" do
    assert @review.valid?
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
  
end