class RoundParticipation < ActiveRecord::Base
  belongs_to :player
  belongs_to :round
end
