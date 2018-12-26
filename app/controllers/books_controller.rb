class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:new,:edit,:show]
  before_action :correct_book ,only: [:edit]
  def index
    # @user = User.find_by(id: current_user.id)
    @books = Book.all.order(created_at: "DESC").limit(3)
    @books1 = Book.all.order(article: "ASC")
    @rank = Book.find(Favorite.group(:book_id).order('count(book_id) desc').limit(5).pluck(:book_id))
    @htmls = Book.where(category: "HTMLCSS")
    @rubys = Book.where(category: "RubyOnRails")
    @jss = Book.where(category: "JavaScript")
    @gits = Book.where(category: "GitHub")
  end

  def show
    @book = Book.find(params[:id])
    @user= @book.user
    @favoritescount = Favorite.where(book_id:@book.id).count
    @bookcomment = BookComment.new
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
      redirect_to books_path,notice: "ブックマークの投稿に成功しました。"
    else
      render new_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id),notice: "ブックマークのアップデートに成功しました。"

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to user_path(@book.user.id),notice: "ブックマークの削除に成功しました。"
  end

  private
  def book_params
    params.require(:book).permit(:article,:url,:comment,:image,:category)
  end
  def correct_book
    book = Book.find(params[:id])
      if current_user != book.user
        redirect_to book_path(book.id)
      end
  end
end
