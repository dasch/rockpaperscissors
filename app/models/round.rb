class Round < ActiveRecord::Base
  has_many :participations, :class_name => "RoundParticipation"
  has_many :participants, :through => :participations, :source => :player

  DEFEATING_GESTURES = {"rock" => "paper", "paper" => "scissors", "scissors" => "rock"}

  def losers
    participations.select do |participation|
      participations.any? {|p| p.gesture == DEFEATING_GESTURES[participation.gesture] }
    end.collect(&:player)
  end
    
  def winner
    winners = participants - losers
    return winners.first if winners.length == 1
  end
end
