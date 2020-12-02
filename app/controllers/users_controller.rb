class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users =User.all
    @newbook =Book.new
  end

    def create
     @newbook = Book.new(book_params)
     @newbook.user_id = current_user.id
    if @newbook.save
      flash[:notice] = "Book was successfully ctreated."
     redirect_to book_path(@book)
     else
     @users= User.all
     render :index
   end
  end


  def show
    @newbook =Book.new
    @user =User.find(params[:id])
    @books =@user.books
  end

  def edit
  @user = User.find(params[:id])
   if @user.id != current_user.id
   redirect_to user_path(current_user.id)
  end
  end

  def update
    @user =User.find(params[:id])
   if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  else render :edit
  end
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end


end
