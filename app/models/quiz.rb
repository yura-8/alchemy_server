class Quiz < ApplicationRecord
    has_one :quiz_word, dependent: destroy
    belongs_to :quiz_meaning
end
