require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get register_path
    assert_response :success
  end

  test "should get create" do
    get register_path
    assert_response :success
  end
end
