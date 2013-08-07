class Person < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
end
