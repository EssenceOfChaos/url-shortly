require 'rails_helper'

RSpec.describe Url, type: :model do

  it "is valid with a valid url" do
    url = build(:url)
    expect(url).to be_valid
  end
end
