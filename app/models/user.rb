class User < ApplicationRecord

  has_secure_password

  before_save :strip_whitespace

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end
  

  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
