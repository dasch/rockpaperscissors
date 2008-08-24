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
    assert_equal Round::SCISSORS, rounds(:one).gesture_for(players(:emil))
  end

  def test_gestures
    assert_equal [Round::ROCK, Round::PAPER, Round::SCISSORS], Round::GESTURES
  end

  def test_gesture_immutability
    assert_raise(TypeError) { Round::GESTURES[0] = 7 }
  end

  def test_defeating_gestures
    assert_equal Round::PAPER,    Round.defeating_gesture_for(Round::ROCK)
    assert_equal Round::SCISSORS, Round.defeating_gesture_for(Round::PAPER)
    assert_equal Round::ROCK,     Round.defeating_gesture_for(Round::SCISSORS)
  end
end
