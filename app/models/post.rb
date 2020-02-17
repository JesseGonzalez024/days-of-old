class Post < ApplicationRecord
    validates :title, :year, presence: true
    validates :year, numericality: { only_integer: true }
   
    belongs_to :user   
    has_many :comments
    has_many :users, through: :comments

    def self.if_user_does_not_exist
        Post.all.each do |post|
            if post.user == nil
                post.comments.each do |comment|
                    comment.destroy
                end
                post.destroy
            end
        end
    end

    def self.common_era_posts
        posts = Post.order("year ASC").where(era: 'Common Era (AD)')
        return posts
    end

    def self.before_common_era
        posts = Post.order("year DESC").where(era: 'Before Common Era (BC)')
        return posts
    end
end