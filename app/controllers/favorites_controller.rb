class FavoritesController < ApplicationController
	 before_action :authenticate_user!
  def create
  	@favorite = Favorite.new(user_id:current_user.id,book_id:params[:book_id])
  	@favorite.save
  	redirect_to books_path
    # favorite = {'user_id' => @favorite.user_id,'book_id' => @favorite.book_id }
    # render json: favorite  # コントローラーが呼ばれた際に、Json形式でデータを渡す
  end

  def destroy
  	@favorite = Favorite.find_by(user_id:current_user,book_id:params[:book_id])
  	@favorite.destroy
  	redirect_to books_path
  end
end
