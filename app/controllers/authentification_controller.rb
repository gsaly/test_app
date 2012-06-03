class AuthentificationController < ApplicationController

  def sign_in
    if params[:user]
      @user = User.authenticate(params[:user][:login], params[:user][:password])
      if @user
        session[:user_id] = @user.id
        session[:username] = @user.login

        flash[:notice] = 'Vous etes maintenant connecte'
        redirect_to @user #'/index'
      else
        flash[:warning] = 'Echec de connexion, votre login et/ou mot de passe sont incorrects'
      end
    end
  end


  def sign_out
    reset_session
    session[:user_id] = nil
    session[:username] = nil

    redirect_to root_url #'/'
  end


  def sign_up
    @user = User.new
    #render 'shared/signup.html.erb', :user => @user
    render 'sign_up'
  end
end
