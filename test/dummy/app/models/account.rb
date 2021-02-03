class Account < ApplicationRecord
  include Glowstick::Syncable
  has_many :projects
  glowstick :name, relationships: [:projects]
end
