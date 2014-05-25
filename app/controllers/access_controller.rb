class AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def index
  end

  def login
  end

  def attempt_login
  	if params[:email].present? && params[:password].present?
      found_user = User.where(:email => params[:email]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:nom_prenom] = authorized_user.nom_prenom
      flash[:notice] = "Vous êtes maintenant connecté"
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid email/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
  	  # mark user as logged out
      session[:user_id] = nil
      session[:username] = nil
      flash[:notice] = "Logged out"
      redirect_to(:action => 'login')
  end

end
