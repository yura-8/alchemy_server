class CreateRanking < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.text :user_name, :null => false
      t.integer :score, :null => false, :default => 0
      t.timestamps
    end
  end
end
