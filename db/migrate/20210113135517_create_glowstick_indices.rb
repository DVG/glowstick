class CreateGlowstickIndices < ActiveRecord::Migration[6.0]
  def change
    create_table :glowstick_indices do |t|
      t.references :syncable, polymorphic: true, null: false
      t.string :uuid

      t.timestamps
    end
    add_index :glowstick_indices, :uuid
  end
end
