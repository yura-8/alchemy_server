class QuizsController < ApplicationController
    def show
        random_quizs = Quiz.order("RANDOM()").limit(:params[:quiz_num])
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
