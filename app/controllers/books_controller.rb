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
    @books = Book.all
    @users = User.all
    @newbook = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user  #User.find(params[:id])
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy#Book.find(params[:id])
    redirect_to books_path
  end

end

private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end