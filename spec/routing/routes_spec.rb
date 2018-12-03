require 'rails_helper'

RSpec.describe "Routes", :type => :routing do
  it "root route works" do
    expect(:get => "/").to route_to(
      :controller => "urls",
      :action => "index"
    )
  end

  it "posts create new resource" do
    expect(:post => "/urls").to route_to(
      :controller => "urls",
      :action => "create"
    )
  end


end
