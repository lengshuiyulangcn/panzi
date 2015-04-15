class Tag
  include Mongoid::Document
  field :title, type: String
  has_and_belongs_to_many :products, :autosave=>true
  accepts_nested_attributes_for :products
  index({ :title=>1 }, { unique: true}) 
end
