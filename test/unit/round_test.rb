require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  def test_participations
    assert_same_collection round_participations(:one_emil, :one_niklas, :one_daniel), rounds(:one).participations
  end

  def test_participants
    assert_same_collection players(:emil, :niklas, :daniel), rounds(:one).participants
  end

  def test_winner
    assert_equal players(:niklas), rounds(:one).winner
  end

  def test_losers
    assert_same_collection players(:emil, :daniel), rounds(:one).losers
  end

  def test_tie
    assert !rounds(:one).tie?
    assert  rounds(:two).tie?
  end

  def test_gesture_for
    assert_equal "scissors", rounds(:one).gesture_for(players(:emil))
  end
end
