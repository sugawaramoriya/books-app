class BooksController < ApplicationController
  before_action :login_required

    def index 
      @books = Book.where(login_userId: current_user.id)
    end

    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
        @user = current_user
        @item = []

    end

    def create
       @book = Book.new(book_params)
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
        @book = Book.find(params[:id])
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

      def search
        if params[:title]
          @item= []
          if params[:title].present? || params[:isbn].present?
            @item = RakutenWebService::Books::Book.search(keyword: params[:title])
            Rails.logger.warn('=======================')
            Rails.logger.warn(@item)
            Rails.logger.warn('=======================')
            render 'new'
          end
        end
      end 

      
    private
      def book_params
        params.require(:book).permit(:title, :author).merge(login_userId: current_user.id)
      end

      def login_required
        redirect_to login_path unless current_user
        #ユーザーがログインしていない限り、ログイン画面にレダイレクトする
      end
end
