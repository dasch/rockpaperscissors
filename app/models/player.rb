class Player < ActiveRecord::Base
  validates_length_of :name, :within => 2..40
end
