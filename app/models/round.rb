class Round < ActiveRecord::Base
  has_many :participations, :class_name => "RoundParticipation"
  has_many :participants, :through => :participations, :source => :player

  DEFEATING_GESTURES = {"rock" => "paper", "paper" => "scissors", "scissors" => "rock"}

  def winner
    losers = []
    
    participations.each do |participation|
      if participations.any? {|p| p.gesture == DEFEATING_GESTURES[participation.gesture] }
        losers << participation
      end
    end
    
    winners = participations - losers

    return winners.first.player if winners.length == 1
  end
end
