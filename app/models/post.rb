class Post < ApplicationRecord
  validates_presence_of :title, :author, :description
end


