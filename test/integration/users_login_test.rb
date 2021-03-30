require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tucu)
  end

  test 'login state' do
    get login_path
    post login_path, params: { session: { name: @user.name } }
    assert user_logged_in?
    get login_path
    assert_redirected_to @user
    assert_not flash.empty?
  end
end
