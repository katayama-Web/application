class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def index
    @user = current_user
    @users = User.all
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id), flash: { notice: 'successfully' }
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(books_path) unless @user == current_user
  end
  
end