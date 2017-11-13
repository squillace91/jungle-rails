class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews, class_name: "User", foreign_key: "user_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  # validates :password, presence: true
  validates :password, length: { in: 6..20 }
  # validates :password_confirmation, presence: true
  # validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }

  class << self # Class methods
    def authenticate_with_credentials (email, password)
      user = User.find_by_email(email.strip.downcase)
      if user && user.authenticate(password.strip)
        user
      else
        nil
      end
    end
  end
end
