require 'test_helper'

class RoundParticipationTest < ActiveSupport::TestCase
  def test_round
    assert_equal rounds(:one), round_participations(:one_emil).round
  end

  def test_player
    assert_equal players(:emil), round_participations(:one_emil).player
  end

  def test_gesture
    assert_equal "scissors", round_participations(:one_emil).gesture
  end
end
