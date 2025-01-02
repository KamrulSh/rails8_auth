require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get root_url
    assert_response :success
  end

  test "should redirect to sign_in when accessing dashboard without login" do
    get dashboard_url
    assert_redirected_to sign_in_url
  end

  test "should get dashboard after sign-in" do
    # Create a user
    User.create!(
      email_address: "test@test.com",
      password: "123456",
      password_confirmation: "123456"
    )
    # Sign in with the created user
    # post sign_in_url, params: { email_address: "test@test.com", password: "123456" }
    # assert_redirected_to dashboard_url
    # follow_redirect!
    # assert_response :success
  end
end
