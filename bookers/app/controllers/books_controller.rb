class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
  end

  def new
    @book = Book.new
  end

# まだ未完成～～～～～～～～～～～～～～～～
  def create
    book = Book.new(book_params)
    book.save
    redirect_to show_books_path(blog.id)

  end



  private
  def book_params
    params.require(:book).permit(:本のタイトル, :感想)
  end






end
