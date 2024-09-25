class CreateRanking < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :score
      t.integer :game_id
      t.timestamps
    end
  end
end
