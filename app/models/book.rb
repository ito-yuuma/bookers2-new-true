class Book < ApplicationRecord

    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    validates :user_id, presence: false
    belongs_to :user, optional: true
    has_many :favorites, dependent: :destroy
    has_many :book_comments, dependent: :destroy
    def favorited_by?(user)
    favorites.exists?(user_id: user.id)
    end

end
