# frozen_string_literal: true

class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    short_url = rand(1_111_111...9_999_999).to_s
    Url.new(url_params.merge(short_url:)).save
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
