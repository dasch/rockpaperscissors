require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end
end
