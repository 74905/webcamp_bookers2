class UsersController < ApplicationController
  def index
    @users =User.page(params[:page]).reverse_order
    @newbook =Book.new
  end
  
    def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully ctreated."
     redirect_to book_path(@book)
     else
     @books= Book.all
     @users= User.all
     render :index
   end
  end

  
  def show
    @user =User.find(params[:id])
    @books =@user.books.page(params[:page]).reverse_order
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
