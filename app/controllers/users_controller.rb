class UsersController < ApplicationController
 
  def profile
      set_user
  end 
 
  def update
      set_user
      if @user.update(user_params)
        render :profile,success: "ユーザーを更新しました"
      else
          flash.now[:danger] = "ユーザーを更新できませんでした"
          render :profile
      end
  end

  private
  def set_user
      @user = User.find(current_user.id)
  end

  def user_params
      params.require(:user).permit(:email,:name,:image,:comment)
  end

end