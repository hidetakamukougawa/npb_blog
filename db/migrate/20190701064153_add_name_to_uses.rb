# frozen_string_literal: true

class AddNameToUses < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, unique: true
  end
end
