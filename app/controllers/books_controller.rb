class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
      @book = Book.new
  end

  def create
    @book = Book.find_by(isbn: params[:isbn])
    if @book.nil?
      googlebook = GoogleBooks.search("isbn:#{params[:isbn]}").first
      @book = Book.create(title: googlebook.title, authors: googlebook.authors,  publisher: googlebook.publisher, published_date: googlebook.published_date, description: googlebook.description, isbn: googlebook.isbn, page_count: googlebook.page_count, categories: googlebook.categories, average_rating: googlebook.average_rating, ratings_count: googlebook.ratings_count, language: googlebook.language, preview_link: googlebook.preview_link, info_link: googlebook.info_link, image_link: googlebook.image_link)
    end
    bookcase = Bookcase.find(params[:bookcase_id])
    bookcase.books << @book
    redirect_to bookcase_path(bookcase)
  end

  def show
  end

  def index
    @books = Book.all
  end

  def destroy
  end

  def search
    @books = Book.search_google(params[:search])
    flash[:notice] = "Here are books with titles or authors matching #{params[:search]} from Google."   
    render :index
  end

  private
  def set_user
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :authors, :publisher, :published_date, :description, :isbn, :page_count, :categories, :average_rating, :ratings_count, :language, :preview_link, :info_link, :image_link)
  end
end
