# frozen_string_literal: true

# controller for our the index page
# all user are allowed to request these
class HomeController < ApplicationController
  def index
    @editions = Edition.order(:number).last(5)
  end
end
