class ProductImage
  include Mongoid::Document

#  attr_accessible :image
  mount_uploader :image, ProductUploader
 field :image, type: String
  belongs_to :product
end
