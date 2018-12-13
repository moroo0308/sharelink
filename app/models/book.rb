class Book < ApplicationRecord

	enum category:{'一般':0,テクノロジー:1,アニメ:2}

	has_many :favorites,dependent: :destroy
	has_many :book_comments,dependent: :destroy
	belongs_to :user

	attachment :image
end
