require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @url = urls(:one)
  end

  test "should get index" do
    get urls_url, as: :json
    assert_response :success
  end

  test "should create url" do
    assert_difference('Url.count') do
      post urls_url, params: { url: { clicks: @url.clicks, original: @url.original, shortened: @url.shortened, title: @url.title } }, as: :json
    end

    assert_response 201
  end

  test "should show url" do
    get url_for(@url), as: :json
    assert_response :success
  end

  test "should update url" do
    patch url_for(@url), params: { url: { clicks: @url.clicks, original: @url.original, shortened: @url.shortened, title: @url.title } }, as: :json
    assert_response 200
  end

  test "should destroy url" do
    assert_difference('Url.count', -1) do
      delete url_for(@url), as: :json
    end

    assert_response 204
  end
end
