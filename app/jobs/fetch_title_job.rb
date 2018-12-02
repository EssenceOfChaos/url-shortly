class FetchTitleJob < ApplicationJob
  queue_as :default
  include SuckerPunch::Job

  def perform(*args)
    # Do something later
  end
end
