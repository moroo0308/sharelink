class BooksController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
