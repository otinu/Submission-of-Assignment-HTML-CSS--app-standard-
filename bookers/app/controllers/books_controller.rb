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
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "successfully!"
      redirect_to book_path(@book)
    else
      flash[:notice] = "error / can't be blank"
      @books=Book.all
      render action: :edit
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
      render action: :index
    end
  end





  private
  def book_params
    params.require(:book).permit(:title, :body)

  end







end
