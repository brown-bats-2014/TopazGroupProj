get '/signup' do
  erb :signup
end

get '/signin' do
  erb :signin
end


post '/session' do
  user = User.find_by_email(params[:email])
  if !user.nil? && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:notice] = "Login information incorect"
    redirect '/signin'
  end
end


get '/session' do
  session[:user_id] = nil
  redirect '/signin'
end

get '/survey/new' do
  erb :_s
end