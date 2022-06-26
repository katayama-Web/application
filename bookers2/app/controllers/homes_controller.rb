class HomesController < ApplicationController

  def top 
      @user = current_user
  end
    
    
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
