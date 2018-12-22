class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
         has_many :book_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy

         has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
         has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy

         has_many :following,through: :active_relationships, source: :following
         has_many :followers,through: :passive_relationships, source: :follower
         attachment :image


        def follow(other_user)
         	active_relationships.create(following_id: other_user.id)
        end

        def unfollow(other_user)
        	active_relationships.find_by(following_id: other_user.id).destroy
        end

        def following?(other_user)
        	following.Include?(other_user)
        end
end
