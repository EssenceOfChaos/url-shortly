class FetchTitleJob < ApplicationJob
  queue_as :default
  include SuckerPunch::Job

  def perform(url_object)
    url = url_object.original
    response = Nokogiri::HTML::Document.parse(HTTParty.get(url).body).title
  end
end

