require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  def setup
    @emil = players(:emil)
  end
  def test_name
    assert_equal "Emil Sjøntoft", @emil.name
  end

  def test_can_change_name
    @emil.name = 'Fef'
    assert_equal "Fef", @emil.name
  end
end
