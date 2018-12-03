require 'rails_helper'

RSpec.describe Url, type: :model do
  before :each do
    @valid_url = Url.create!(original: "www.example.com/path/to/file/index.html", clicks: 0)
    @popular_url = Url.create!(original: "http://domain.com", clicks: 99)
    @unpopular_url = Url.create!(original: "https://math.com/extra/homework", clicks: 1)
  end

  it "passes with valid url" do
    expect(@valid_url).to be_valid
  end

  it "is invalid with invalid url" do
    url = Url.new(original: "ftp:::lol.core")
    expect(url).to_not be_valid
  end

  it "is invalid with no url" do
    url = Url.new(original: nil)
    expect(url).to_not be_valid
  end

  it "sanitizes url with extra spaces" do
    url = Url.new(original: "   http://example.com/copy/paste/w/spaces  ")
    url.sanitize
    expect(url).to be_valid
  end




end
