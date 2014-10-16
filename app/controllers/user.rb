post '/users/new' do
  if params[:password] == params[:verify_password]
    user = User.create(email: params[:email], password: params[:password])
    if user.id.nil?
      flash[:notice] = 'Email address has already been used'
      redirect '/signup'
    else
      session[:user_id] = user.id
      redirect '/'
    end
  else
    flash[:notice] ="Your passwords do not match"
    redirect '/signup'
  end
end
