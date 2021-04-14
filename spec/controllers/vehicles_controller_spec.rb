require 'rails_helper'

RSpec.describe VehiclesController, type: :controller do
  let(:user) { FactoryBot.create :user }
  let!(:vehicle) { FactoryBot.create :vehicle, user: user }

  describe 'GET #index' do
    before do
      get :index
    end

    it 'returns http success' do
      expect(response.status).to eq 200
    end
    it 'assigns @vehicles' do
      expect(assigns(:vehicles)).to eq([vehicle])
    end
    it 'renders the index template' do
      expect(response).to render_template :index
    end
  end

  describe 'POST #import' do
    context 'when valid format' do
      before do
        @file = fixture_file_upload('test_uploader.csv', 'csv')
      end

      it 'successfully imports the records into the database' do
        expect { post :import, params: { file: @file } }.to change { Vehicle.count }.from(1).to(8)
      end
    end

    context 'when invalid format' do
      before do
        @file = 'invalid_format.txt'
      end

      it 'fails to execute and redirects' do
        post :import, params: { file: @file }
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq('Invalid format!')
      end
    end
  end

  describe 'GET #export' do
    context 'when valid request' do
      before do
        get :export, format: :csv, params: { export_type: 'customer' }
      end

      it 'generates the csv' do
        expect(response.header['Content-Type']).to include 'text/csv'
        expect(response.body).to include(user.nationality)
      end
    end

    context 'when invalid request' do
      before do
        get :export, format: :csv, params: { export_type: 'lalablabla' }
      end

      it 'raises invalid type error' do
        expect(response).to redirect_to root_path
        expect(flash[:alert]).to eq('Invalid type!')
      end
    end
  end
end
