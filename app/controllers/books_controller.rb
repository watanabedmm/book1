class BooksController < ApplicationController
  def top

  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to books_path
    flash[:success] = 'Book was successfully created.'
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
     flash[:success] = 'Book was successfully updated.'
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
     flash[:success] = 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
