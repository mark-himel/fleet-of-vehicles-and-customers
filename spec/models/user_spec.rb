require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :email }
  it { is_expected.to validate_presence_of :nationality }
  it { is_expected.to have_many :vehicles }

  describe 'validation of email' do
    context 'when the email is valid' do
      let(:valid_user) { FactoryBot.build(:user) }

      it 'validates the user valid' do
        expect(valid_user.valid?).to eq true
      end
    end

    context 'when the email is invalid' do
      let!(:user) { FactoryBot.create(:user, email: 'hello@world.com')}
      let(:invalid_user) { FactoryBot.build(:user, email: 'hello@world.com') }

      it 'validates the user invalid' do
        expect(invalid_user.valid?).to eq false
      end
    end
  end
end
