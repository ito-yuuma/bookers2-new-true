class BooksController < ApplicationController
before_action :correct_user, only: [:edit, :update]

  def index
    @books = Book.all
    @booker = Book.new
    @book = Book.find_by(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if@book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])

  end

  def update
      @books = Book.find(params[:id])
      if  @books.update(book_params)
          flash[:notice] = "You have updated book successfully."
         redirect_to book_path(@books.id)
      else
          @books = Book.find(params[:id])
          @books.update(book_params)
          render :edit
      end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end


end
