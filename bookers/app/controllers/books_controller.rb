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
      redirect_to book_path(book.id) #ローカル変数book内に保存されたidの値を指定
    else
      flash[:notice] = "error / can't be blank"
      redirect_to books_path         #フラッシュメッセージは(省略)/layouts/application.html.erb 内に記述しているから、indexにリダイレクトした際に表示される。
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "successfully!"
      redirect_to books_path
    else
      redirect_to books_path   #フラッシュメッセージは(省略)/layouts/application.html.erb 内に記述しているから、indexにリダイレクトした際に表示される。
    end
  end
  
  def balse
    


  private
  def book_params
    params.require(:book).permit(:title, :body)

  end

end
