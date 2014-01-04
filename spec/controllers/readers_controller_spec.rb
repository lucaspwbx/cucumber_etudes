require 'spec_helper'

describe ReadersController do
  let(:reader) { mock_model("Reader").as_new_record }

  describe 'GET new' do
    it 'assigns @reader variable to the view' do
      allow(Reader).to receive(:new).and_return(reader)
      get :new
      expect(assigns[:reader]).to eq reader
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template :new
    end
  end
end
