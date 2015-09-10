require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @review = Review.new(author: "Joe Schmo", summary: "this is the best movie ever", 
              description: "A man walks into a terrible scenario.")
  end
  
  test "review shouls be valid" do
    assert @review.valid?
  end
  
  test "author should be present" do
    @review.author = " "
    assert_not @review.valid?
  end
  
end