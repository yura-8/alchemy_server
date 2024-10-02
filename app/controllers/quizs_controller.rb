class QuizsController < ApplicationController
    def show
        quiz_word = Quiz.select(:quiz_word, quiz_meaning).find_by(quiz_word :params[:quiz_word])
        render json: quiz_word
    end
end
