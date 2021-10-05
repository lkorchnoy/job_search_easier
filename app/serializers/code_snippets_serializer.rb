class CodeSnippetsSerializer < ActiveModel::Serializer
  has_many :snippets
  attributes :title, :snippets 
end
