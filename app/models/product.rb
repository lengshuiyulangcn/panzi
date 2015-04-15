class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  validates_presence_of :name, :message=>"物品名称不能为空"
  validates_length_of :name, :minimum=>2, :maximun=>20,  :too_short=>"标题长度应在2到20字节之间", :too_long=>"标题长度应在2到20字节之间"
   #field :images, type: Array
  field :description, type: String
  validates_presence_of :description, :message=>"商品描述不能为空"
  belongs_to :creater, :class_name=>"User", :inverse_of=>"my_products"
  has_and_belongs_to_many :followers, :class_name=>"User",:autosave=>true, :inverse_of=>"my_follows"
  has_many :product_images
  accepts_nested_attributes_for :product_images, :allow_destroy => true
  has_and_belongs_to_many :tags,:autosave=>true
  accepts_nested_attributes_for :tags, :allow_destroy => true
  validates_presence_of :tags, :message=>"至少得有一个标签"
end
