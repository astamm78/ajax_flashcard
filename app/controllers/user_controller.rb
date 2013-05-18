get '/sign_in' do
  @title = " | Sign In"
  erb :signin
end

get '/user_page' do
  @title = " | #{current_user.full_name}"
  erb :user
end

post '/sign_in' do
  if User.authenticate(params[:email], params[:password])
    @user = User.find_all_by_email(params[:email]).first
    session[:user_id] = @user.id
    @title = " | #{current_user.full_name}"
    erb :user
  else
    @user = nil
    @errors = "Your information doesn't match our records. Deal with it."
    @title = " | Sign Up"
    erb :signin
  end
end

get '/sign_up' do
  @title = " | Sign Up"
  erb :signup
end

post '/sign_up' do
  @user = User.new(:full_name => params[:full_name],
                      :email => params[:email],
                      :password => params[:password])

  if @user.save
    session[:user_id] = @user.id
    erb :user
  else
    @user = nil
    @errors = "Please enter your full name,<br>a proper email and a password."
    erb :signup
  end
end

get '/result' do
  erb :results
end

get '/logout' do
  session[:user_id] = nil
  session[:round_id] = nil
  redirect to '/'
end

get '/quit_round' do
  @total_questions = current_round.cards.count
  @total_correct = current_round.guesses.where(:correct => true).count

  session[:round_id] = nil
  erb :results

end
