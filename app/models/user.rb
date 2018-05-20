class User < ApplicationRecord
  validates :google_userid, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :name, presence: true
end
