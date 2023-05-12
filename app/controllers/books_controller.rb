class BooksController < ApplicationController
  before_action :login_required

    def index 
      #@books = Book.where(login_userId: current_user.id)
      @books = Book.all
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
        @user = current_user
    end

    def create
       @book = Book.new(book_params)
       #@book = Book.new(title: params[:title],author: params[:author],login_userId: current_user.id)
       if @book.save
          redirect_to @book
       else
          render :new, status: :unprocessable_entity
       end
    end

    def edit
      @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id],current_user.id)
        if @book.update(book_params)
          redirect_to @book
        else
          render :new, status: :unprocessable_entity
        end
      end

      def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
      end
      
    private
      def book_params
        params.require(:book).permit(:title, :author)
      end

      def login_required
        redirect_to login_path unless current_user
        #ユーザーがログインしていない限り、ログイン画面にレダイレクトする
      end
end
