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
      redirect_to book_path
    else
      flash[:notice] = "error / can't be blank"
      render action: :edit
    end
  end

  def create
    book = Book.new(book_params)
    if book.save
      flash[:notice] = "successfully!"
      redirect_to book_path(book.id)
    else
      flash[:notice] = "error / can't be blank"
      redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "successfully!"
      redirect_to books_path
    else
      redirect_to books_path
    end
  end





  private
  def book_params
    params.require(:book).permit(:title, :body)

  end







end
