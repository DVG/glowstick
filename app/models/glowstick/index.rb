module Glowstick
  class Index < ApplicationRecord
    belongs_to :syncable, polymorphic: true

    after_initialize :generate_uuid

    private

    def generate_uuid
      self.uuid ||= SecureRandom.uuid
    end
  end
end
