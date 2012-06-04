class AuthentificationController < ApplicationController

  def sign_in
    if params[:user]
      @user = User.authenticate(params[:user][:login], params[:user][:password])
      if @user
        cookies.permanent[:remember_token] = @user.remember_token
        current_user = @user

        session[:user_id] = @user.id
        session[:username] = @user.login

        flash[:success] = 'Vous etes maintenant connecte'
        redirect_to @user #'/index'
      else
        flash.now[:error_explanation] = 'Echec de connexion, votre login et/ou mot de passe sont incorrects'

      end
    end
  end


  def sign_out
    current_user = nil
    cookies.delete(:remember_token)

    reset_session
    session[:user_id] = nil
    session[:username] = nil

    flash[:warning] = "Vous etes maintenant deconnecte"
    redirect_to root_path #'/'
  end

end
