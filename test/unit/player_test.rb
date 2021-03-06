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

  def test_must_have_name
    @emil.name = nil
    assert !@emil.valid?
  end

  def test_name_must_be_greater_than_1
    @emil.name = "X"
    assert !@emil.valid?
  end
end
