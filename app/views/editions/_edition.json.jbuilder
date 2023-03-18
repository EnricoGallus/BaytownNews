json.extract! edition, :id, :title, :desc, :number, :distribution, :issue, :created_at, :updated_at
json.url edition_url(edition, format: :json)
json.issue url_for(edition.issue)
