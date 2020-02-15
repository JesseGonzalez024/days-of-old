class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :title, :year, presence: true
    validates :year, numericality: { only_integer: true }
end