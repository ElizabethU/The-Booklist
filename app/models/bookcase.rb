class Bookcase < ActiveRecord::Base
  has_many :bookcase_books
  has_many :books, through: :bookcase_books
  belongs_to :user
end











