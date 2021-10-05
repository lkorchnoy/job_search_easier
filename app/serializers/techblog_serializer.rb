class TechblogSerializer < ActiveModel::Serializer
  has_many :blogs
  attributes :title, :blogs 
end
