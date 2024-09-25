class Ranking < ApplicationRecord
    has_many :game
    belongs :user_name
    belongs :score
end
