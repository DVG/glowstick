module Glowstick
  class EntitiesController < ApplicationController
    def index
      @glowstick_entities = Glowstick::Index.all
      render json: {
        entities: @glowstick_entities.map { |e| Glowstick::EntitySerializer.new(e.syncable).serializable_hash }
      }.to_json
    end

    def create
    end
  end
end