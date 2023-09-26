# frozen_string_literal: true

class CreateEditions < ActiveRecord::Migration[7.0]
  def change
    create_table :editions do |t|
      t.string :title
      t.string :desc
      t.integer :number
      t.date :distribution

      t.timestamps
    end
  end
end
