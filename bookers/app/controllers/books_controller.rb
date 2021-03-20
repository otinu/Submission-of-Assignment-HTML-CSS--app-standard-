class BooksController < ApplicationController
  def index
    @books = Book.all

  end

  def show
     @book = Book.find(params[:id])
  end

  def edit
  end

#newアクションは必要？
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
    redirect_to '/top'

  end



  private
  def book_params
    params.permit(:本のタイトル, :感想)

  end







end
