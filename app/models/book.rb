class Book < ActiveRecord::Base
  has_many :bookcase_books
  has_many :bookcases, through: :bookcase_books

  def self.search(query)
    Book.where(["title LIKE ? OR authors LIKE ?", "%#{query}%", "%#{query}%"])
  end

  def self.search_google(query)
    GoogleBooks.search(query, {:count => 20})
  end

  def self.sort_by_popularity(book_collection)
    book_collection.each do |book_record|
    end
  end
end
