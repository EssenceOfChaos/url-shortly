class FetchTitleJob < ApplicationJob
  queue_as :default
  include SuckerPunch::Job

  # fetches the document's title from the url
  # we parse the markup and retrieve the value of <title>
  def perform(url_object)
    url = url_object.original
    response = Nokogiri::HTML::Document.parse(HTTParty.get(url).body).title
  end
end

