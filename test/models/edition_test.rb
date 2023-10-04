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
require 'test_helper'

class EditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
