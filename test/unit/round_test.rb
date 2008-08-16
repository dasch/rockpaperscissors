require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  def test_participations
    assert_same_collection round_participations(:one_emil, :one_niklas), rounds(:one).participations
  end

  def test_participants
    assert_same_collection players(:emil, :niklas), rounds(:one).participants
  end

  def test_winner
    assert_equal players(:niklas), rounds(:one).winner
  end
end
