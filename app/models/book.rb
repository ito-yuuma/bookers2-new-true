class Book < ApplicationRecord

    validates :title, presence: true
    validates :body, presence: true, length: { maximum: 200 }
    validates :user_id, presence: false
    belongs_to :user, optional: true


end
