require 'rails_helper'

RSpec.describe UrlsController, type: :controller do
  describe "GET #show" do
    before :each do
      @url = create(:url, original: "example.com/extra/long/link")
      @url.sanitize
      @url.save
    end

    it "has a 302 status code" do
      get :show, params: { shortened: @url.shortened}
      expect(response.status).to eq(302)
    end

  end
end
