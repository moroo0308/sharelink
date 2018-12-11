class Book < ApplicationRecord

	enum category:{'一般':0,テクノロジー:1,アニメ:2}

	has_many :favorites
	has_many :book_comments
	belongs_to :user
end
