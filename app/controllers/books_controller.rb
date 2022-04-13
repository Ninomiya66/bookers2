class BooksController < ApplicationController

  def index
    
    @books = Book.all
    
    @book = Book.new
    
  end
  
  # Create　Book
  def create
    
    @book = Book.new(book_params)
    
    @book.user_id = current_user.id
    
    @book.save
    
    redirect_to root_path
    
  end

  def show
    
    @book = Book.find(params[:id])
    
  end

  def edit
    
    @book = Book.find(params[:id])
    
  end
  
  def destroy
    
    @book = Book.find(params[:id])
    
    @book.destroy
    
    redirect_to book_path
    
  end
  
   # 投稿データのストロングパラメータ
  private

  def book_params
    
    params.require(:book).permit(:title, :body)
    
  end

end
