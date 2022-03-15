require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_index_url
    assert_response :success
  end

  test "should get login_check" do
    get accounts_login_check_url
    assert_response :success
  end
end
