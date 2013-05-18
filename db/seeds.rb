require 'csv'


headers = [:question, :answer]

@in = Deck.create(:name => "Inventors")

CSV.foreach(APP_ROOT.join('public', 'inventors.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 4
  Card.create(hash)
end

