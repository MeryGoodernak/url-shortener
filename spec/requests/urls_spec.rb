# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Urls' do
  describe 'GET /' do
    let(:paragraph) do
      'Just copy that long URL and paste it down blew in the form and I will make it short and easy to remember'
    end

    before { get root_path }

    it 'renders the new template' do
      expect(response).to have_http_status(:ok)
    end

    it 'has a pragraph asking user for the long URL' do
      expect(response.body).to include(paragraph)
    end
  end

  describe 'POST /urls' do
    let(:url_params) { { long_url: 'http:://thisisjustfortest.com' } }

    it 'creates a new record to DB' do
      expect do
        post urls_path, params: { url: url_params }
      end.to change(Url, :count).by(1)
    end
  end

  describe 'GET /urls/:id' do
    let(:url) { Url.create(short_url: 'test', long_url: 'testtesttest.com') }
    let(:paragraph) { 'Look how short it is now:' }

    before { get url_path(url) }

    it 'render the show page for the URL' do
      expect(response).to have_http_status(:ok)
    end

    it 'has a pragraph asking user for the long URL' do
      expect(response.body).to include(paragraph)
    end
  end
end
