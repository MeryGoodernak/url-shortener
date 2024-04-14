# frozen_string_literal: true

class UrlsController < ApplicationController
  before_action :set_url, only: %i[show edit update]

  def show; end

  def new
    @url = Url.new
  end

  def edit; end

  def create
    url = Url.new(url_params.merge(short_url: build_short_url))
    url.save
    redirect_to url_path(url)
  end

  def update
    @url.update(url_params.merge(short_url: build_short_url))
    redirect_to url_path(@url)
  end

  private

  def set_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:long_url)
  end

  def build_short_url
    rand(1_111_111...9_999_999).to_s
  end
end
