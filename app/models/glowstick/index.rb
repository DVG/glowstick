module Glowstick
  class Index < ApplicationRecord
    belongs_to :syncable, polymorphic: true
  end
end
