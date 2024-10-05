class MiddlequizsController < ApplicationController
    def show
        random_quizs = Middlequiz.order("RANDOM()").limit(params[:id].to_i)
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
