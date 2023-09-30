class Book < ApplicationRecord

    validates :title, presence: true
    validates :body, presence: true
    validates :user_id, presence: false
    belongs_to :user, optional: true


end
