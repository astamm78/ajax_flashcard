require 'csv'


headers = [:question, :answer]

Deck.create(:name => "Inventors")

CSV.foreach(APP_ROOT.join('public', 'inventors.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 1
  Card.create(hash)
end

Deck.create(:name => "State Abbreviations")

CSV.foreach(APP_ROOT.join('public', 'states.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 2
  Card.create(hash)
end

