class Edition < ApplicationRecord
  has_one_attached :issue
  has_rich_text :description
end
