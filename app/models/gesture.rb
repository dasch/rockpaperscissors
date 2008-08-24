
class Gesture
  GESTURES_STRINGS = %w(rock paper scissors)

  class << self
    protected :new
  end

  def initialize(gesture)
    @gesture = gesture
  end

  def == other
    @gesture == other.to_i
  end

  def < other
    @gesture.succ % 3 == other
  end

  def to_s
    GESTURES_STRINGS[@gesture]
  end

  def to_i
    @gesture
  end

  ROCK, PAPER, SCISSORS = (0..2).map {|i| new(i) }
  GESTURES = [ROCK, PAPER, SCISSORS].freeze
end
