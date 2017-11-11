class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, class_name: "User", foreign_key: "user_id"
end
