require 'csv'

CSV.foreach('db/ejdict.csv',quote_char: "\x00", force_quotes: true) do |row|
    p  row[0]
    Quiz.create(:quiz_word => row[0], :quiz_mean => row[1])
end