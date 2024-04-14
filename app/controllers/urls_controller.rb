# frozen_string_literal: true

class UrlsController < ApplicationController
  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def edit
    @url = Url.find(params[:id])
  end

  def create
    short_url = rand(1_111_111...9_999_999).to_s
    url = Url.new(url_params.merge(short_url:))
    url.save
    redirect_to url_path(url)
  end

  def update
    short_url = rand(1_111_111...9_999_999).to_s
    url = Url.find(params[:id])
    url.update(url_params.merge(short_url:))
    redirect_to url_path(url)
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
