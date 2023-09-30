class UsersController < ApplicationController
  def show
    @book = Book.new
    @users = User.all
  end

  def new

    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    flash[:notice] = "You have updated user successfully."
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user.id)

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
