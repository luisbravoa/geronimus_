class PublicController < ApplicationController
  def index
  end

  def new
    render("login")
  end

  def create
    if params.include?(:user)
      user = User.where([" username = ? OR email = ?", params[:user][:email_username].downcase, params[:user][:email_username]]).first
      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to(:controller => 'songs', :action => 'index')
      else
        flash.now[:error] = "Incorrect username or password."
        @email_username = params[:user][:email_username]
        render("login")
      end
    else
      render("login")
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to(:action => "index")
  end


end
