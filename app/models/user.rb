class User < ActiveRecord::Base
  before_validation :downcase_fills
  has_secure_password

  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    converted_email = email.downcase.strip
    user = User.find_by_email(converted_email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

  private

  def downcase_fills
    self.email = email.downcase.strip if email.present?
  end

end
