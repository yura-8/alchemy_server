class CreateQuiz < ActiveRecord::Migration[6.1]
  def change
    create_table :quizzes do |t|
      t.string :quiz_word
      t.text :quiz_meaning
      t.timestamps
    end
  end
end
