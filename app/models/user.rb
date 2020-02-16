class User < ApplicationRecord
    
    has_secure_password

    validates :username, uniqueness: {message: "username has already been taken" }
    
    has_many :posts
    has_many :comments
    
    has_many :commented_posts, through: :comments, source: :post 

end