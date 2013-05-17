class Round < ActiveRecord::Base

  belongs_to :deck
  belongs_to :user
  has_many :guesses
  has_many :cards, :through => :guesses

  def results
    [self.deck.name,
       ((self.guesses.where(:correct => true).count/ self.deck.cards.count.to_f)*100).round(2)]
  end
end
