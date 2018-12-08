class Book < ApplicationRecord
	has_many :favorites
	has_many :book_comments
	belongs_to :user
	belongs_to :category
end
