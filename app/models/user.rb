class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :password_digest, length: { minimum: 8, maximum: 20 }
end
