class BooksController < ApplicationController
  def index
   @books = Book.all
   @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:complete]="Book was successfully created."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:complete]="Book was successfully updated."
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:complete]="Book was successfully destroyed."
      redirect_to "/books"
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
  end