# frozen_string_literal: true

# migration script to remove the desc column, which was converted to rich text
class RemoveDescFromEditions < ActiveRecord::Migration[7.0]
  def up
    remove_column :editions, :desc, :string
  end

  def down
    add_column :editions, :desc, :string
  end
end
