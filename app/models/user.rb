class User < ApplicationRecord
  validates :name, presence: true,length: { minimum: 1, maximum: 15 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
      
  has_secure_password
  validates :password, presence: true, format: { with: /\A[0-9A-Za-z]{8,32}\z/ }
  
end 