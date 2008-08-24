class CreateRoundParticipations < ActiveRecord::Migration
  def self.up
    create_table :round_participations do |t|
      t.references :player, :round, :null => false
      t.integer :gesture, :null => false
    end
  end

  def self.down
    drop_table :round_participations
  end
end
