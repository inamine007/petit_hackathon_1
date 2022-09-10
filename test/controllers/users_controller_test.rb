require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "サインアップpath" do
    get signup_path
    assert_response :success
  end
end
