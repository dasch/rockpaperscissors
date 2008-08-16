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

  def test_must_have_player
    assert !create_participation(:player => nil).valid?
  end

  def test_must_have_round
    assert !create_participation(:round => nil).valid?
  end

  def test_uniqueness
    assert !create_participation(:player => players(:emil)).valid?
  end

  protected

  def create_participation(options = {})
    defaults = {:round => rounds(:one), :player => players(:anders), :gesture => "rock"}
    RoundParticipation.new(defaults.update(options))
  end
end
