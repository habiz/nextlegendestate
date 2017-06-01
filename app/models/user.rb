class User < ApplicationRecord
  # initialize users with different properties and terminate listing with the user exit
  has_many :properties, dependent: :destroy
  # show the required fields by calling the validate method
  before_save { mail.downcase! }
  validates(:fname, presence: true, length: { maximum: 50 })
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:mail, presence: true, length: { maximum: 244 },
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false })
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

# defines proto-feed for post updates
  def feed

  end
class << self
  # Returns the hash digest of the given string.
  def digest(string)
  cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST
:
                                                BCrypt::Engine.cost
BCrypt::Password.create(string, cost: cost)
  end
# Returns a random token.
  def new_token
  SecureRandom.urlsafe_base64
  end
end
# Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
  update_attribute(:remember_digest, User.digest(remember_token))
  end
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
