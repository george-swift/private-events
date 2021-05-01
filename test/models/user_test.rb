require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Tucu')
  end

  test 'name should be present' do
    @user.name = '  '
    assert_not @user.valid?
  end

  test 'name should be unique' do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end
end
