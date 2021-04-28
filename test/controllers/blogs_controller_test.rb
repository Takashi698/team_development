require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
<<<<<<< HEAD
  # test "the truth" do
  #   assert true
  # end
=======
  test "should get new" do
    get blogs_new_url
    assert_response :success
  end

  test "should get index" do
    get blogs_index_url
    assert_response :success
  end

>>>>>>> 7b25731bae8954f59de6521cdb6306a2d54f4042
end
