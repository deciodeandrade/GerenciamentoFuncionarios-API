require 'rails_helper'

RSpec.describe "/cargos", type: :request do
  
  let(:valid_attributes) {
    attributes_for(:cargo)
  }

  let(:invalid_attributes) {
    attributes_for(:cargo, descricao: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Cargo.create! valid_attributes
      get cargos_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cargo = Cargo.create! valid_attributes
      get cargo_url(cargo), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Cargo" do
        expect {
          post cargos_url,
               params: { cargo: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Cargo, :count).by(1)
      end

      it "renders a JSON response with the new cargo" do
        post cargos_url,
             params: { cargo: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Cargo" do
        expect {
          post cargos_url,
               params: { cargo: invalid_attributes }, as: :json
        }.to change(Cargo, :count).by(0)
      end

      it "renders a JSON response with errors for the new cargo" do
        post cargos_url,
             params: { cargo: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          descricao: 'Meu novo Cargo',
          atividades: 'Minhas novas atividades'
        }
      }

      it "updates the requested cargo" do
        cargo = Cargo.create! valid_attributes
        patch cargo_url(cargo),
              params: { cargo: new_attributes }, headers: valid_headers, as: :json
        cargo.reload
        expect([cargo.descricao, cargo.atividades]).to eq([new_attributes[:descricao], new_attributes[:atividades]])
      end

      it "renders a JSON response with the cargo" do
        cargo = Cargo.create! valid_attributes
        patch cargo_url(cargo),
              params: { cargo: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the cargo" do
        cargo = Cargo.create! valid_attributes
        patch cargo_url(cargo),
              params: { cargo: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cargo" do
      cargo = Cargo.create! valid_attributes
      expect {
        delete cargo_url(cargo), headers: valid_headers, as: :json
      }.to change(Cargo, :count).by(-1)
    end
  end
end
