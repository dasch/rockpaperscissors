require 'test_helper'

class RoundTest < ActiveSupport::TestCase
  def test_participations
    assert_equal round_participations(:one_emil, :one_niklas).sort_by(&:id), 
                 rounds(:one).participations.sort_by(&:id)
  end

  def test_participants
    assert_equal players(:emil, :niklas).sort_by(&:id), 
                 rounds(:one).participants.sort_by(&:id)
  end
end
