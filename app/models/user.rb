class User < ApplicationRecord
    has_secured_password
    has_many :posts
    has_many :comments, through: :posts
end