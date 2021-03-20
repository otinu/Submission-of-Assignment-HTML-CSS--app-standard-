class BooksController < ApplicationController

  def index
    @books = Book.all

  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "successfully!"
      redirect_to books_path(book_params)
    else
      render action: :index
    end

  end

   #newアクションは必要？
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully!"
      redirect_to book_path(book.id)
    else
      render action: :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "successfully!"
      redirect_to books_path
    else
      render action: :index
    end
  end





  private
  def book_params
    params.require(:book).permit(:本のタイトル, :感想)

  end







end
