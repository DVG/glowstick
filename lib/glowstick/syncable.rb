module Glowstick
  module Syncable
    extend ActiveSupport::Concern

    included do
      mattr_accessor :_glowstick_attributes
    end

    class_methods do
      def glowstick(*attributes)
        self._glowstick_attributes ||= attributes
      end
    end

    def glowstick_attrs
      self.class._glowstick_attributes.each_with_object({}) do |key, attrs|
        attrs[key] = self.public_send(key)
      end
    end

  end
end