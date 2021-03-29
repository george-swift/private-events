require 'test_helper'

class UsersSignUpTest < ActionDispatch::IntegrationTest
  test 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '  ' } }
    end
    assert_template 'users/new'
    assert_not flash[:success]
  end

  test 'valid signup information' do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: 'Ubong' } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert_not flash[:danger]
    assert user_logged_in?
  end
end
