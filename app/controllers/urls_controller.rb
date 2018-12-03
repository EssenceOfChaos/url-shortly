class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all
    render json: @urls
  end

  # Redirect to original url given shortened url
  def show
    redirect_to @url.original
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
