class User < ApplicationRecord
    validates :user_name, presence: true
    validates :password, presence: true
end
