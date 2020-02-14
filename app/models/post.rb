class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, :year, presence: true
end