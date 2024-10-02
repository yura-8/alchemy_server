class RankingsController < ApplicationController
    def create
        Ranking.create(user_name: params["user_name"], score :params["score"])
    end

    def show
        rankings = Ranking.all;
        render json: rankings
    end
end