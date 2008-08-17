class RoundsController < ApplicationController
  def index
    @rounds = Round.find(:all, :limit => 10, :order => "created_at DESC")
  end
end
