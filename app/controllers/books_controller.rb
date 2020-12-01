class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @newbook = Book.new
  end

  def create
     @newbook = Book.new(book_params)
     @newbook.user_id = current_user.id
    if @newbook.save
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
    @book_comment = BookComment.new
    @user = @book.user
    # @user = User.find(@book.user.id)
    # @user = User.find(@book.user_id)
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  end