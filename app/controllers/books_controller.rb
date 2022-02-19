class BooksController < ApplicationController

  # before_action :baria_user, only: [:edit, :destroy, :update]


  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)#情報取得
    @book.user_id = current_user.id #取得した情報のuser_idへ、現在のuserを代入することで、同一と
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      #@book = Book.new
      @user = current_user
      render :index

    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    #@users = @books.user#
   #@users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user  #User.find(params[:id])
    @newbook = Book.new
  end

  # @user = User.find(params[:id]) #book Showでは@user = @book.user
   # @book = Book.find(params[:id]) #book Showでは@book = Book.find(params[:id])

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end


  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  # def baria_user
  #   unless book.find(params[:id]).user.id.to_i == current_user.id
  #   redirect_to books_path(current_user)
  # end
