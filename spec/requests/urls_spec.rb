# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Urls' do
  describe 'GET /' do
    before { get root_path }

    it 'renders the new template' do
      expect(response).to have_http_status(:ok)
    end

    it 'has a pragraph asking user for the long URL' do
      paragraph =
        'Just copy that long URL and paste it down blew in the form and I will make it short and easy to remember'
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

    before { get url_path(url) }

    it 'renders the show page for the URL' do
      expect(response).to have_http_status(:ok)
    end

    it 'has a pragraph asking user for the long URL' do
      paragraph = 'Look how short it is now:'
      expect(response.body).to include(paragraph)
    end
  end

  describe 'GET /urls/:id/edit' do
    let(:url) { Url.create(short_url: 'edit', long_url: 'testtesttesteditedit.com') }

    before { get edit_url_path(url) }

    it 'renders the edit template page' do
      expect(response).to have_http_status(:ok)
    end

    it 'has a pragraph asking user to customize the long or short URL' do
      paragraph = 'Here you can update your long URL and we generate a new short URL accordingly.'
      expect(response.body).to include(paragraph)
    end
  end

  describe 'PATCH /urls/:id' do
    let(:url) { Url.create(short_url: 'edit', long_url: 'testtesttesteditedit.com') }
    let(:url_params) { { long_url: 'testtesttestupdated.com' } }

    it 'updates the changed attribute correctely and saved the record to DB' do
      expect do
        patch url_path(url), params: { url: url_params }
        url.reload
      end.to change(url, :long_url).from('testtesttesteditedit.com').to('testtesttestupdated.com')
    end
  end

  describe 'DELETE /urls/:id' do
    let(:url) { Url.create(short_url: 'niceurl', long_url: 'testtesttestdlete.com') }
    let(:deleted_url) { Url.create(short_url: 'deleted', long_url: 'testtesttestdlete.com') }

    before do
      url
      deleted_url
    end

    it 'deletes the record' do
      expect { delete url_path(deleted_url) }.to change(Url, :count).by(-1)
    end
  end
end
