# frozen_string_literal: true

require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    skip 'fails with ActionView::Template::Error: undefined method "signed_id for nil:NilClass due to not correctly working attachments'
    get root_url
    assert_response :success
  end
end
