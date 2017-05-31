class User < ApplicationRecord
  include Clearance::User

  enum access_level: [:customer, :moderator, :superadmin]

  has_many :authentications, :dependent => :destroy
  has_many :listings , :dependent => :destroy

  # validates :age, presence: true
  validates :name, presence: true

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(name: auth_hash["extra"]["raw_info"]["name"],age: auth_hash["extra"]["raw_info"]["age_range"].min[1], email: auth_hash["extra"]["raw_info"]["email"], password: SecureRandom.hex(4))
      user.authentications << (authentication)      
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end
end
 