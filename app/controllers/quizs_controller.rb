class QuizsController < ApplicationController
    def show
        random_quizs = Quiz.order("RANDOM()").limit(:params[:quiz_num])
        render json: {
            quiz: random_quizs.map do |quiz|
            {
                word: quiz.word,
                meaning: quiz.meaning
            }
            end
        } 
    end
end
