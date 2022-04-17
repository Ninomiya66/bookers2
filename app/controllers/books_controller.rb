class BooksController < ApplicationController

  def index
    
    @user = current_user
    
    @books = Book.all
    
    @book = Book.new
    
  end
  
  # Create　Book
  def create
    
    @book = Book.new(book_params)
    
    @book.user_id = current_user.id
    
    @book.save
    
    redirect_to books_path(@book)
    
  end

  def show
    
    @user = current_user
    
    @book = Book.find(params[:id])
    
    @user = @book.user
    
  end

  def edit
    
    @book = Book.find(params[:id])
    
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
