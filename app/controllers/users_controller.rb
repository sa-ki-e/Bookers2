class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @books = @user.books 
    @newbook = Book.new
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user  #User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated profile successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end

