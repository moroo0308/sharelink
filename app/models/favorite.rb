class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :book

	validates :user_id,{presence: true}
	validates :book_id,{presence: true}
	# ---いいねのデータは常に両方が存在していないと不完全なデータとなるため記入(空の状態じゃできないという意味)---- #

end
