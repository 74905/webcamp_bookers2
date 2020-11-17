class UsersController < ApplicationController
  def index
    @users =User.all
    @books =Book.all
  end

  
  def show
    @user =User.find(params[:id])
    @book =Book.find(params[:id])
  end
  def edit
  @user = User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
 

end
