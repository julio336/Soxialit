class User < ActiveRecord::Base
  attr_accessible :description, :email, :name, :picture, :password, :password_confirmation
  attr_writer :description
  attr_writer :picture
  has_secure_password
  mount_uploader :picture, PictureUploader
  
  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token
     
 def description
   return "Description" if @description.nil?
   @description
  end
  
  def picture
     return "Picture" if @picture.nil?
     @picture
  end
  
    
  validates :name,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 500 }
  validates(:picture, presence:true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  private

   def create_remember_token
       self.remember_token = SecureRandom.urlsafe_base64
   end
   
end
