module AuthentificationHelper
  def sign_in_after_signup(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
  
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  #store the request location, for redirecting after
  def store_location
    session[:return_to] = request.fullpath
  end

end
