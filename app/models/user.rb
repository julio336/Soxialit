class User < ActiveRecord::Base
  attr_accessible :description, :email, :name, :picture, :password, :password_confirmation
  has_secure_password
  
  before_save {|user| user.email = email.downcase}
  
  validates :name,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates(:picture, presence:true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
end
