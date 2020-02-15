class User < ApplicationRecord
    has_secure_password

    validates :username, uniqueness: {message: "username has already been taken" }
    has_many :posts
    has_many :recived_comments, through: :posts, source: :comments

    has_many :comments 
    # comments they have given 
    # has_many commented posts


end