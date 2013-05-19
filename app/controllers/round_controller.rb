post '/question' do

  if current_round && (current_round.deck.cards - current_round.cards).empty?

    @total_questions = current_round.cards.count
    @total_correct = current_round.guesses.where(:correct => true).count

    session[:round_id] = nil
    erb :results
  else
    @working = Deck.find_by_name(params[:decks])

    @round = current_round || Round.create( :deck_id => @working.id, :user_id => current_user.id )
    session[:round_id] = @round.id

    @card = (@working.cards - current_round.cards).sample

    erb :question
  end

end

# get '/question' do
#   erb :question
# end

post '/answer' do

  @guess = Guess.create(  :card_id => params[:card_id],
                          :guess => params[:answer],
                          :correct => Card.find_by_id(params[:card_id]).correct?(params[:answer]),
                          :round_id => current_round.id )

  erb :answer, :layout => false
end
