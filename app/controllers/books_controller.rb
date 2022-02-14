class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)#情報取得
    @book.user_id = current_user.id #取得した情報のuser_idへ、現在のuserを代入することで、同一と
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end
end

private

  def book_params
    params.require(:book).permit(:title, :body )
  end