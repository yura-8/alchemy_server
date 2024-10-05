class CreateQuiz < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :quiz_word, :null => false
      t.text :quiz_meaning, :null => false
      t.timestamps
    end
  end
end
