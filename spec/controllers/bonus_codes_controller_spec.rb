require "rails_helper"

RSpec.describe BonusCodesController do
  describe "GET validate" do
    before do
      get :validate, product_id: product_id, bonus_code: code_value
    end

    context 'when inexistent product' do
      let(:product_id) { 0 }
      let(:code_value) { 'invalid_code' }

      it 'responds with 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when inexistent code' do
      let(:product_id) { FactoryGirl.create(:product).id }
      let(:code_value) { 'invalid_code' }
      it 'responds with 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when the code does not belong to the product' do
      let(:product_id) { FactoryGirl.create(:product).id }
      let(:code_value) { FactoryGirl.create(:code).value }
      it 'respons with 404' do
        expect(response).to have_http_status(404)
      end
    end

    context 'when product and code are valid' do
      context 'when the code is not sold' do
        let(:product) { FactoryGirl.create(:product) }
        let(:product_id) { product.id }
        let(:code_value) { FactoryGirl.create(
          :code,
          product: product,
          sold: false
        ).value }

        it 'responds with 403' do
          expect(response).to have_http_status(403)
        end
      end

      context 'when code is sold' do
        let(:product) { FactoryGirl.create(:product) }
        let(:product_id) { product.id }
        let(:code_value) { FactoryGirl.create(
          :code,
          product: product,
          sold: true
        ).value }
        it 'responds with 200' do
          expect(response).to have_http_status(200)
        end
      end
    end
  end
end