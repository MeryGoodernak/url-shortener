# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Urls' do
  describe 'GET /' do
    it 'renders the new template' do
      get root_path
      expect(response).to have_http_status(:ok)
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
end
