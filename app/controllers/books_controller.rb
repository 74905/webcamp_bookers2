class BooksController < ApplicationController
  def index
    @books = Book.all
    @users = User.all
    @book = Book.new
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
     redirect_to book_path(@book)
   else
     @books= Book.all
     @users= User.all
     render :index
   end
  end

  def show
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
  end

  def edit
  end

  def update
  end

  def destroy
  end
  end