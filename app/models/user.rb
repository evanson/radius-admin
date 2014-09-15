class User < ActiveRecord::Base
  has_secure_password


  before_save { |user| user.email = email.downcase }
  before_create :create_remember_token

  validates :firstname, presence: true
  validates :lastname, presence: true
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6}, confirmation: true
  validates :password_confirmation, presence: true
  #validates_confirmation_of :password

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def name
    firstname + ' ' + lastname
  end

  # def mailboxer_email(user)
  #   email
  # end

  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
