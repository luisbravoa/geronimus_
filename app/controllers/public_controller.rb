class PublicController < ApplicationController
  def index
  end

  def login
    puts params.inspect

    if params.include?(:email_username)
      @user = User.where([" username = ? OR email = ?", params['email_username'], params['email_username']]) if params['email_username']
      puts @user
      if @user
        redirect_to(:controller => 'songs', :action => 'index')
      end
    end



  end

  def logut
  end

end
