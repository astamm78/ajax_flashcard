require 'csv'


headers = [:question, :answer]
@aa = Deck.create(:name => "Amino Acids")
@wc = Deck.create(:name => "World Capitals")
@sc = Deck.create(:name => "State Capitals")


CSV.foreach(APP_ROOT.join('public', 'aminos.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 1
  Card.create(hash)
end

CSV.foreach(APP_ROOT.join('public', 'world_capitals.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 2
  Card.create(hash)
end

CSV.foreach(APP_ROOT.join('public', 'states.csv')) do |row|
  hash = Hash[headers.zip(row)]
  hash[:deck_id] = 3
  Card.create(hash)
end

