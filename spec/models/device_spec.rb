require 'rails_helper'

RSpec.describe Device, type: :model do
  context 'relations' do
    it { should belong_to(:user) }
  end

  context 'attributes' do
    before do
      @device = create(:device, :with_user)
    end

    it 'should have device attributes' do
      expect(@device.name).to_not be_nil
      expect(@device.identification_string).to_not be_nil
    end
  end
end
