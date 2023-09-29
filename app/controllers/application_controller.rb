# frozen_string_literal: true

# default application logic
class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&)
    locale = params[:locale] || I18n.default_locale
    if I18n.available_locales.include?(locale.to_sym)
      I18n.with_locale(locale, &)
    else
      # Handle the case where an invalid locale is provided
      I18n.with_locale(I18n.default_locale, &)
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
