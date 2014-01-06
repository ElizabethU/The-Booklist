class BookcaseBooksController < ApplicationController

  def update
    bookcase_book = BookcaseBook.find_by(bookcase_id: params[:bookcase_id], book_id: params[:book_id])
    bookcase_book.update(bookcase_id: (bookcase_book.bookcase_id + 1))
    redirect_to bookcase_path(bookcase_book.bookcase_id)
  end

  def destroy
    bookcase_book = BookcaseBook.find_by(bookcase_id: params[:bookcase_id], book_id: params[:book_id])
    bookcase_book.destroy
    redirect_to bookcase_path(bookcase_book.bookcase_id)
  end

  private

  def bookcase_book_params
     params.require(:bookcase_book).permit(:book_id, :bookcase_id)
  end

end
