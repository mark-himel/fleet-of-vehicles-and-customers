require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it { is_expected.to validate_presence_of :model }
  it { is_expected.to validate_presence_of :year }
  it { is_expected.to validate_presence_of :chassis_number }
  it { is_expected.to validate_presence_of :color }
  it { is_expected.to validate_presence_of :registration_date }
  it { is_expected.to validate_presence_of :odometer_reading }
  it { is_expected.to belong_to :user }

  describe 'validation of chassis_number' do
    context 'when the chassis_number is valid' do
      let(:vehicle) { FactoryBot.build(:vehicle) }

      it 'validates the vehicle valid' do
        expect(vehicle.valid?).to eq true
      end
    end

    context 'when the chassis_number is invalid' do
      let!(:vehicle) { FactoryBot.create(:vehicle, chassis_number: 1234)}
      let(:invalid_vehicle) { FactoryBot.build(:vehicle, chassis_number: 1234, user_id: 100) }

      it 'validates the vehicle invalid' do
        expect(invalid_vehicle.valid?).to eq false
      end
    end
  end
end
