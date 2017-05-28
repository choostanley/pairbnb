class User < ApplicationRecord
  include Clearance::User

  include Clearance::User

  validates :age, presence: true
  validates :name, presence: true
end
