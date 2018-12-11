class BooksController < ApplicationController
  def index
    @user = User.find_by(id: current_user.id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render new_book_path
    end
  end

  def update
  end

  def destroy
  end
  private
  def book_params
    params.require(:book).permit(:article,:url,:comment)
  end
end
