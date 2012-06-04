class ApplicationController < ActionController::Base
  protect_from_forgery
  include AuthentificationHelper

  helper_method  :user_sign_in?, :deny_access, :current_id, :current_user, :current_user?, :current_username

  before_filter :authorize , :only =>[:index, :edit, :update]

  ################ Gestion des logs ################

  $logger = Logger.new(STDOUT)

  $logger.level = Logger::INFO

  $logger.formatter = proc{|s,t,p,m|"%5s [%s] (%s) %s :: %s\n" % [s,t.strftime("%Y-%m-%d %H:%M:%S"), $$, p, m]}


  def current_id
    session[:user_id]
  end

  #def current_user=(user)
  #  @current_user = user
  #end

  def current_user
    #current_id ? User.find(current_id) : nil
    @current_user ||= current_id && User.find(current_id)
    #@current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end
  
  
  def current_user?(user)
    user == current_user
  end


  def current_username
    session[:username]
  end


  def authenticity
    deny_access unless !user_sign_in?
  end

  def user_sign_in?
    #session[:user_id].nil?
    !current_user.nil?
  end


  def deny_access
    redirect_to signin_path
  end

  protected

  def permission_denied
    flash[:warning] = "Desole, vous n'etes pas autorise a acceder a cette page."
    redirect_to root_url
    #redirect_to '/home'
  end

  private
  
  def authorize
    unless  User.find_by_id(session[:user_id])   # User.find_by_remember_token(cookies[:remember_token]) #
      #redirect_to(:controller=> "authentification", :action=> "sign_in", :notice => "votre session a expiree, veuillez vous authentifier a nouveau")
      redirect_to(sign_in_path, :notice => "votre session a expiree, veuillez vous authentifier a nouveau")
      User.find_by_remember_token(cookies[:remember_token])
    end
    return true
  end

end
