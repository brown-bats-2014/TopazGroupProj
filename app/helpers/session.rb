helpers do
  def current_user
    return nil if session[:user_id].nil?
    @current_user ||= User.find(session[:user_id])
  end

  def redirect_to_login
    redirect '/signin' if current_user.nil?
  end

  def check_ownership(obj)
    unless obj.user_id == current_user.id
      flash[:notice] = "You are not the owner of this #{obj.class}."
      redirect '/'
    end
  end
end
