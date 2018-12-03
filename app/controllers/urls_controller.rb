class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls - order by desc aka highest number of clicks first
  def index
    @urls = Url.order(clicks: :desc)
    render json: @urls
  end

  # Redirect to original url given shortened url, increment clicks
  def show
    if redirect_to @url.original
      @url.clicks += 1
      @url.save
    end
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    @url.original = params[:url]
    @url.sanitize
    @url.title = FetchTitleJob.perform_now(@url)

    if @url.save
      render json: @url, status: :created
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      render json: @url
    else
      render json: @url.errors, status: :unprocessable_entity
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
  end

  private
    # Given a shortened url, return the original
    def set_url
      @url = Url.find_by({shortened: params[:shortened]})
    end

    # White list params
    def url_params
      # passed in by w/ POST req via urls?url= <url_params>
    end
end
