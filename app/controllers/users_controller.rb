class UsersController < ApplicationController
  def show
  	@user = current_user
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  end

  def update
  end
end
