class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
    def top
    end
    
    def new
      @book = Book.new
    end
    
    def show
      @book = Book.find(params[:id])
      #@user = @book.user.name
      @user = current_user
      #@uuser = User.find(params[:id])
    end
    
    def index
      @user = current_user
      @books = Book.all
      @book = Book.new
    end
    
    def create
      @books = Book.all
      @user = current_user
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
      redirect_to book_path(@book.id), flash: { notice: 'successfully' }
      else
      render :index 
      end
    end
    
    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      redirect_to books_path
    end
    
    def edit
      @user = current_user
      @book = Book.find(params[:id])
    end
    
    def update
      @user = current_user
      @book = Book.find(params[:id])
      if @book.update(book_params)
        redirect_to book_path(@book.id), flash: { notice: 'successfully' }
      else
        render :edit
      end
    end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email]) 
    end
    
  def book_params
    params.require(:book).permit(:title, :body)  
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

  
end