class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
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
  		redirect_to user_path(@user), notce: "保存しました"
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
end
