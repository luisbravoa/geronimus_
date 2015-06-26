class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash.now[:notice] = "User was created successfully!"
      puts flash[:notice]
      redirect_to(:action => 'index')
    else
      render ("new")
    end

  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
  end

  def index
  end


  private
  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
  end
end
