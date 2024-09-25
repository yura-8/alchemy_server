class CreateGame < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :level
      t.integer :quiz_number
      t.timestamps
    end
  end
end
