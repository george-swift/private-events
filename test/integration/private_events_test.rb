require 'test_helper'

class PrivateEventsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tucu)
  end

  test 'acessing a private page triggers friendly forwarding' do
    get new_event_path
    log_in_as(@user)
    assert_redirected_to new_event_path
  end
end
