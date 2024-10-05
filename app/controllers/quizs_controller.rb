class QuizsController < ApplicationController
    def show
        p quiz_num = params[:id].to_i
        random_quizs = Quiz.limit(quiz_num)
        render json: {
            quiz: random_quizs.map do |quiz|
            {
                word: quiz.quiz_word,
                meaning: quiz.quiz_meaning
            }
            end
        }
    end
end
