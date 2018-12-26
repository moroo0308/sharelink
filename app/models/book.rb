class Book < ApplicationRecord

	enum category:{HTMLCSS: 0, RubyOnRails: 1, JavaScript: 2, GitHub: 3}

	has_many :favorites,dependent: :destroy
	has_many :book_comments,dependent: :destroy
	belongs_to :user

	attachment :image

	validates :article, {presence:true}
	validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
	validates :comment, length:{maximum:200}
end
