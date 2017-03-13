require 'bcrypt'
class User < ActiveRecord::Base
	include BCrypt
  has_secure_password

  private

  def self.authenticate(email,password)
    user = User.find_by(email: email)
    if user && user.authenticate
      user
    else
      nil
    end
end
