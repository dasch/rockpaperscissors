require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def test_integer_representations
    assert_equal 0, Gesture::ROCK.to_i
    assert_equal 1, Gesture::PAPER.to_i
    assert_equal 2, Gesture::SCISSORS.to_i
  end

  def test_string_representations
    assert_equal "rock",     Gesture::ROCK.to_s
    assert_equal "paper",    Gesture::PAPER.to_s
    assert_equal "scissors", Gesture::SCISSORS.to_s
  end

  def test_comparisons
    assert Gesture::ROCK     < Gesture::PAPER
    assert Gesture::PAPER    < Gesture::SCISSORS
    assert Gesture::SCISSORS < Gesture::ROCK
  end

  def test_gestures
    assert_equal [Gesture::ROCK, Gesture::PAPER, Gesture::SCISSORS], Gesture::GESTURES
  end
end
