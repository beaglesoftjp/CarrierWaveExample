class PictureStore < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
end
