class RoundParticipation < ActiveRecord::Base
  belongs_to :player
  belongs_to :round

  validates_presence_of :player_id, :round_id, :gesture
  validates_uniqueness_of :player_id, :scope => :round_id
  validates_inclusion_of :gesture, :in => %w(rock paper scissors)
end
