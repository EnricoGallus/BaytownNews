# frozen_string_literal: true

# == Schema Information
#
# Table name: editions
#
#  id           :bigint           not null, primary key
#  distribution :date
#  number       :integer
#  title        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Edition < ApplicationRecord
  has_one_attached :issue
  has_rich_text :description
  include PgSearch::Model

  pg_search_scope :search, against: %i[title number distribution], associated_against: {
    rich_text_description: :body
  }
end
