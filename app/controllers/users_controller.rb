class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show,:edit,:favorites]
  before_action :correct_user, only: [:edit]
  def show
  	@user = User.find(params[:id])
    @user1 = current_user
    @a = Favorite.where("user_id = ?", @user)
  end

  def edit
  	@user = User.find_by(id: current_user.id)
  end

  def destroy
    
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
         sign_in(@user, bypass: true)
  		redirect_to user_path(@user), notice: "ユーザーのアップデートに成功しました。"
  	else
  		render :edit
  	end
  end
  def favorites
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id:@user.id)
  end
  private
  def user_params
  	params.require(:user).permit(:name,:email,:password,:password_confirmation,:image)
  end
  def correct_user
    user = User.find(params[:id])
      if current_user != user
        redirect_to user_path(user.id)
      end
  end
end
