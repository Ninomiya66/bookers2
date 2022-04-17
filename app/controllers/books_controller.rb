class BooksController < ApplicationController
  #(ログインユーザー以外の人が情報を遷移しようとした時に制限をかける)
  before_action :authenticate_user!

  def index

    @user = current_user

    @books = Book.all

    @book = Book.new

  end

  # Create　Book
  def create

    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save
      
      flash[:notice] = "You have creatad book successfully."

      redirect_to books_path(@book)
      
    else
      
      @book = Book.all
      
      render :index
      
    end

  end

  def show

    @user = current_user

    @book = Book.find(params[:id])

    @user = @book.user

  end

  def edit

    @book = Book.find(params[:id])

  end

  def update

    @book = Book.find(params[:id])

    @book.update(book_params)

    redirect_to book_path(@book.id)

  end

  def destroy

    book = Book.find(params[:id])

    book.destroy

    redirect_to books_path

  end

   # 投稿データのストロングパラメータ
  private

  def book_params

    params.require(:book).permit(:title, :body)

  end

end
