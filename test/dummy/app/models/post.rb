class Post < ApplicationRecord
  include Glowstick::Syncable

  glowstick :title, :body
end
