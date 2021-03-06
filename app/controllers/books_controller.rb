class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])


  end

  def new

    @book = Book.new

  end

  def create
    #render plain: params[:book].to_s
    @book = Book.new(book_params)
    if @book.save
        redirect_to @book
    else
        render 'new'
    end


  end

  def edit

  end

  def update

  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

  end

  private
  def book_params
    params.require(:book).permit(:isbn, :title,:price)

  end

end
