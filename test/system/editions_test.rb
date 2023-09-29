# frozen_string_literal: true

require 'application_system_test_case'

class EditionsTest < ApplicationSystemTestCase
  setup do
    self.default_url_options = { locale: I18n.default_locale }
    @edition = editions(:issue_january)
  end

  test 'visiting the index' do
    visit editions_url

    assert_selector 'h1', text: I18n.t('edition.header.index')
  end

  test 'should create edition' do
    visit editions_url
    click_link I18n.t('edition.link.new')

    fill_in_rich_text_area 'edition_description', with: @edition.description
    fill_in 'edition_distribution', with: @edition.distribution
    fill_in 'edition_number', with: @edition.number
    fill_in 'edition_title', with: @edition.title
    attach_file('edition_issue', "#{Rails.root}/test/fixtures/files/issue297.pdf")
    click_button 'Create Edition'

    assert_text I18n.t('edition.save.success')
    click_link I18n.t('edition.link.back')
  end

  test 'should update Edition' do
    visit edition_url(@edition)
    click_link I18n.t('edition.link.edit')

    fill_in_rich_text_area 'edition_description', with: @edition.description
    fill_in 'edition_distribution', with: @edition.distribution
    fill_in 'edition_number', with: @edition.number
    fill_in 'edition_title', with: @edition.title
    attach_file('edition_issue', "#{Rails.root}/test/fixtures/files/issue297.pdf")
    click_button 'Update Edition'

    assert_text 'Edition was successfully updated'
    click_link I18n.t('edition.link.back')
  end

  test 'should destroy Edition' do
    visit editions_url
    accept_alert do
      click_link 'Destroy', match: :first
    end

    assert_text 'Edition was successfully destroyed'
  end
end
