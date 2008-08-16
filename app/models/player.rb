class Player < ActiveRecord::Base
  validates_presence_of :name
  validates_length_of :name, :within => 2..40
end
