# frozen_string_literal: true

require 'application_system_test_case'

class EditionsTest < ApplicationSystemTestCase
  setup do
    @edition = editions(:issue_january)
  end

  test 'visiting the index' do
    visit editions_url

    assert_selector 'h1', text: 'Editions'
  end

  test 'should create edition' do
    visit editions_url
    click_link 'New Edition'

    fill_in 'edition_description', with: @edition.description
    fill_in 'edition_distribution', with: @edition.distribution
    fill_in 'edition_number', with: @edition.number
    fill_in 'edition_title', with: @edition.title
    attach_file('edition_issue', "#{Rails.root}test/fixtures/files/issue297.pdf")
    click_link 'Create Edition'

    assert_text 'Edition was successfully created'
    click_link 'Back'
  end

  test 'should update Edition' do
    visit edition_url(@edition)
    click_link 'Edit', match: :first

    fill_in 'edition_description', with: @edition.description
    fill_in 'Distribution', with: @edition.distribution
    fill_in 'Number', with: @edition.number
    fill_in 'Title', with: @edition.title
    click_link 'Update Edition'

    assert_text 'Edition was successfully updated'
    click_link 'Back'
  end

  test 'should destroy Edition' do
    visit editions_url(@edition)
    click_link 'Edit', match: :first
    click_link 'Destroy', match: :first

    assert_text 'Edition was successfully destroyed'
  end
end
