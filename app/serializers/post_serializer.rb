class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :description
end
