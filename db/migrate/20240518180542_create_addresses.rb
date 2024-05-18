# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street, null: false
      t.string :locality, null: false
      t.string :division, null: false
      t.string :postal_code, null: false
      t.string :full_address, null: false, index: { unique: true }
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
