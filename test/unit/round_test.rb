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
    assert  rounds(:three).tie?
  end

  def test_gesture_for
    assert_equal "scissors", rounds(:one).gesture_for(players(:emil))
  end

  def test_gestures
    assert_equal %w(rock paper scissors), Round::GESTURES
  end

  def test_gesture_immutability
    assert_raise(TypeError) { Round::GESTURES[0] = "stone" }
    assert_raise(TypeError) { Round::GESTURES[0].replace("stone") }
  end

  def test_defeating_gestures
    assert_equal "paper",    Round.defeating_gesture_for("rock")
    assert_equal "scissors", Round.defeating_gesture_for("paper")
    assert_equal "rock",     Round.defeating_gesture_for("scissors")
  end
end
