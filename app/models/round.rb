class Round < ActiveRecord::Base
  has_many :participations, :class_name => "RoundParticipation"
  has_many :participants, :through => :participations, :source => :player
end
