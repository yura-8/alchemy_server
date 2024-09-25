class Game < ApplicationRecord
    has_one :level
    belongs_to :quiz_num
end
