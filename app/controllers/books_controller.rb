class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # DBへの保存成功
      flash[:success] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      # DBへの保存失敗
      @books = Book.all
      render "index"
    end
  end

  def show
    # @bookはbefore_action :set_bookで設定されています
  end

  def edit
    # @bookはbefore_action :set_bookで設定されています
  end

  def update
    if @book.update(book_params)
      # DBの更新成功
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      # DBの更新失敗
      render "edit"
    end
  end

  def destroy
  @book = Book.find(params[:id])
  logger.debug "Book to be destroyed: #{@book.inspect}"
  if @book.destroy
    flash[:success] = "Book was successfully destroyed."
    logger.debug "Book destroyed successfully"
  else
    flash[:error] = "Failed to destroy the book."
    logger.debug "Failed to destroy the book: #{@book.errors.full_messages}"
  end
  redirect_to books_path
end



  private
def set_book
  @book = Book.find(params[:id])
end

  def book_params
    params.require(:book).permit(:title, :body)
  end
end