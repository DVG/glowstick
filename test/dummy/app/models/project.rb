class Project < ApplicationRecord
  include Glowstick::Syncable
  belongs_to :account
  glowstick :name
end
