class Person < ActiveRecord::Base
  validates :name, presence: true
  mount_uploader :avatar, AvatarUploader
end
