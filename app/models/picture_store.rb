
class PictureStore < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  validates :picture,
            :file_size => {
                :maximum => 1.megabytes.to_i
            }
end
