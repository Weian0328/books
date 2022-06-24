class BooksController < ApplicationController   
    def index
        @books = Book.all
    end
    

    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if 
            @book.update(book_params)
            redirect_to books_path, notice: "更新成功"
        else
            render :edit
        end
        
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if 
            @book.save
            redirect_to books_path, notice: "新增成功"
        else
            render :new
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path, notice: "刪除成功"
    end

    private
    def book_params
        params.require(:book).permit(:name, :date, :price, :pages, :ISBN)
    end
end