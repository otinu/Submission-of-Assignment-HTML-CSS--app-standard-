class BooksController < ApplicationController
  def index
    @books = Book.all

  end

  def show
    @book = Book.find(params[:id])
    binding.pry
  end

  def edit
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end

  def destroy
    book = @books
    book.destroy
    redirect_to books_path(book)

  end



  private
  def book_params
    params.require(:book).permit(:本のタイトル, :感想)

  end







end
