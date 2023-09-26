# frozen_string_literal: true

# model for one issue of the Baytown News magazine and all its properties
class Edition < ApplicationRecord
  has_one_attached :issue
  has_rich_text :description
end
