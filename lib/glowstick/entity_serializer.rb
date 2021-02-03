module Glowstick
  class EntitySerializer
    def initialize(entity)
      @entity = entity
    end

    def serializable_hash
      {
        uuid: @entity.glowstick_index.uuid,
        type: @entity.class.to_s,
        attributes: @entity.glowstick_attrs,
        relationships: serializable_relationships
      }
    end

    def serialized_json
      serializable_hash.to_json
    end

    private

    def serializable_relationships
      @entity.glowstick_relationships.each_with_object({}) do |relationship_name, obj|
        relation = @entity.public_send(relationship_name)
        if plural_relationship?(relationship_name)
          obj[relationship_name] = relation.map do |r|
            r.glowstick_index.uuid
          end
        else
          obj[relationship_name] = relation.glowstick_index.uuid
        end
      end
    end

    def plural_relationship?(relationship_name)
      reflection = @entity.class.reflect_on_all_associations.find { |a| a.name == relationship_name }
      reflection.class == ActiveRecord::Reflection::HasManyReflection
    end
  end
end