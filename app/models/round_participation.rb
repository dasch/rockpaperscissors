class RoundParticipation < ActiveRecord::Base
  belongs_to :player
  belongs_to :round

  validates_uniqueness_of :player_id, :scope => :round_id
end
