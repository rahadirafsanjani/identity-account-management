class User < ApplicationRecord
  has_secure_password
  
  has_many :access_grants,
           class_name: 'Doorkeeper::AccessGrant',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  has_many :access_tokens,
           class_name: 'Doorkeeper::AccessToken',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, if: -> { new_record? || !password.nil? }

  before_save :downcase_email

  
  def self.register user_params
    
    if user_params[:password] == user_params[:password_confirmation]
      User.create(
        fullname: user_params[:fullname],
        email: user_params[:email],
        password_digest: user_params[:password]
        )
    end
  end
      
  private
  
  def downcase_email
    self.email = email.downcase
  end

end