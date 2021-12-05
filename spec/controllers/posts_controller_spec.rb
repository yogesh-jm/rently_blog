# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController do
  describe '#index' do
    context 'when get call is made to posts' do
      before do
        get :index
      end

      it 'returns a 200 (Ok)' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
