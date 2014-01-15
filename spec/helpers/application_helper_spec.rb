require 'spec_helper'

describe ApplicationHelper do
  describe '#top-menu' do
    it "has register link if reader is not logged in" do
      reader = double("Reader")
      allow(helper).to receive(:current_user) { nil }
      expect(helper.top_menu).to have_link("Register")
    end

    it "has welcome reader message if reader is logged in" do
      reader = double("Reader", email: "email@email.com")
      allow(helper).to receive(:current_user) { reader }
      expect(helper.top_menu).to have_content("Welcome, #{reader.email}")
    end
  end
end
