require 'csv'

CSV.foreach('db/ejdict.csv',quote_char: "\x00", force_quotes: true) do |row|
    Quiz.create(:quiz_word => row[0], :quiz_meaning => row[1])
end

CSV.foreach('db/lowquiz.csv') do |row|
    Lowquiz.create(:quiz_word => row[0], :quiz_meaning => row[1])
end

Ranking.create!(
    user_name: "Hanako",
    score: 10,
)

Ranking.create!(
    user_name: "Kenzi",
    score: 20,
)