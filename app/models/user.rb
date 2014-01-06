class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates             :name, :email, uniqueness: true 
  validates             :name, length: { minumum: 3, maximum: 30 }
  validates_format_of   :email, :with => /\w+@\w+\.\w+/i

  has_secure_password
  has_many :bookcases
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def self.search(query)
    User.where(["name LIKE ? OR email LIKE ?", "%#{query}%", "%#{query}%"])
  end

  def has_it(book)
    i_have_it = false
    bookcases.each do |bookcase|
      bookcase.books.each do |libro|
        if libro.isbn == book.isbn
          i_have_it = true
        end
      end
    end
    i_have_it
  end
end
