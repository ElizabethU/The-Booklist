class BookcaseBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :bookcase
end
