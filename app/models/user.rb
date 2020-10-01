class User < ApplicationRecord
    validates :name, presence :true
    validates :password_digest, length: {minimum:8, maximum:20}
end
