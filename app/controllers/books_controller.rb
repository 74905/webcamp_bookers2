class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
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
    @book = Book.find(params[:id])
    @user = @book.user
    # @user = User.find(@book.user.id)
    # @user = User.find(@book.user_id)
    @newbook = Book.new
  end

  def edit
    @book= Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  end