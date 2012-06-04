module AuthentificationHelper
  def sign_in_after_signup(user)
    cookies.permanent[:remember_token] = user.remember_token
    current_user = user
  end
end
