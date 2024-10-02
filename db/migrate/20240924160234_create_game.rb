class CreateGame < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :quiz_num, :null => false
      t.timestamps
    end
  end
end
