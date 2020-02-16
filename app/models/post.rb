class Post < ApplicationRecord
    validates :title, :year, presence: true
    validates :year, numericality: { only_integer: true }
   
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments

    def self.if_user_does_not_exist
        Post.all.each do |post|
            if post.user == nil
                post.comments.each do |coment|
                    comment.destroy
                end
                post.destroy
            end
        end
    end
end