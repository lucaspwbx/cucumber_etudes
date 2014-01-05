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

  describe 'POST create' do
    let!(:reader) { stub_model(Reader) }
    let(:params) {
      {
        'email' => 'email@email.com',
        'password' => 'pass',
        'password_confirmation' => 'pass'
      }
    }
    before { allow(Reader).to receive(:new).and_return(reader) }

    subject { post :create, reader: params }

    it 'sends new message to Reader class' do
      expect(Reader).to receive(:new).with(params)
      subject
    end

    it 'sends save message to reader model' do
      expect(reader).to receive(:save)
      subject
    end

    context 'when save message returns true' do
      before { allow(reader).to receive(:save).and_return(true) }

      it 'redirects to root url' do
        subject
        expect(response).to redirect_to root_url
      end

      it 'assigns a success flash message' do
        subject
        expect(flash[:notice]).not_to be_nil
      end
    end

    context 'when save message returns false' do
      before do
        allow(reader).to receive(:save).and_return(false)
        post :create, reader: params
      end

      it 'renders new template' do
        expect(response).to render_template :new
      end

      it 'assigns reader variable to the view' do
        expect(assigns[:reader]).to eq reader
      end

      it 'assigns error flash message' do
        expect(flash[:error]).to_not be_nil
      end
    end
  end
end
