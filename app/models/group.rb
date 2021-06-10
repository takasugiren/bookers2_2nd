class Group < ApplicationRecord
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :name, presence: true, uniqueness: true
end
