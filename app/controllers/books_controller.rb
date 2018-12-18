class BooksController < ApplicationController
  def index
    # @user = User.find_by(id: current_user.id)
    @books = Book.all.order(created_at: "DESC").limit(3)
    @books1 = Book.all.order(article: "ASC")

  end

  def show
    @book = Book.find(params[:id])
    @user= @book.user
    @favoritescount = Favorite.where(book_id:@book.id).count
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
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
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)

  end

  def destroy
    @book = Book.find(params:[:id])
    @book.destroy
    redirect_to book_path(@book.id)
  end
  private
  def book_params
    params.require(:book).permit(:article,:url,:comment,:image,:category)
  end
end
