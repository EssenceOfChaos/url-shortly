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

# Alternative method to retrieve the title that doesn't require a
# 3rd party dep and uses regex with a string matcher
# empty titles result in an empty string being returned("")
# response = Net::HTTP.get(URI(url)) =~ /<title>(.*?)<\/title>/
