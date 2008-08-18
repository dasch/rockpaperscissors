class Round < ActiveRecord::Base
  has_many :participations, :class_name => "RoundParticipation"
  has_many :participants, :through => :participations, :source => :player

  GESTURES = %w(rock paper scissors)

  def losers
    participations.select do |participation|
      participations.any? {|p| p.gesture == Round.defeating_gesture_for(participation.gesture) }
    end.collect(&:player)
  end
    
  def winner
    winners = participants - losers
    return winners.first if winners.length == 1
  end

  def tie?
    winner.nil?
  end

  def gesture_for(player)
    participations.find_by_player_id(player).gesture
  end

  def self.defeating_gesture_for(gesture)
    GESTURES.at(GESTURES.index(gesture).succ.modulo(3))
  end
end
