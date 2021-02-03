module Glowstick
  module Syncable
    extend ActiveSupport::Concern

    included do
      mattr_accessor :_glowstick_attributes
      mattr_accessor :_glowstick_relationships
      has_one :glowstick_index, class_name: 'Glowstick::Index', as: :syncable
      after_save :generate_glowstick_index
    end

    class_methods do
      def glowstick(*attributes, relationships: [])
        self._glowstick_attributes ||= attributes
        self._glowstick_relationships ||= relationships
      end
    end

    def glowstick_attrs
      self.class._glowstick_attributes.each_with_object({}) do |key, attrs|
        attrs[key] = self.public_send(key)
      end
    end

    def glowstick_relationships
      self.class._glowstick_relationships
    end

    def generate_glowstick_index
      self.glowstick_index ||= self.create_glowstick_index
    end

  end
end