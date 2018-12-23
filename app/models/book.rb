class Book < ApplicationRecord

	enum category:{HTMLCSS: 0, RubyOnRails: 1, JacaScript: 2, GitHub: 3}

	has_many :favorites,dependent: :destroy
	has_many :book_comments,dependent: :destroy
	belongs_to :user

	attachment :image
end
