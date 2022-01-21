require 'rails_helper'

RSpec.describe "/funcionarios", type: :request do

  #create(:cargo) if Cargo.count == 0

  let(:valid_attributes) {
    attributes_for(:funcionario, cargo_id: Cargo.first.id)
  }

  let(:invalid_attributes) {
    attributes_for(:funcionario, nome: nil)
  }

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Funcionario.create! valid_attributes
      get funcionarios_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      funcionario = Funcionario.create! valid_attributes
      get funcionario_url(funcionario), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Funcionario" do
        expect {
          post funcionarios_url,
               params: { funcionario: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Funcionario, :count).by(1)
      end

      it "renders a JSON response with the new funcionario" do
        post funcionarios_url,
             params: { funcionario: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Funcionario" do
        expect {
          post funcionarios_url,
               params: { funcionario: invalid_attributes }, as: :json
        }.to change(Funcionario, :count).by(0)
      end

      it "renders a JSON response with errors for the new funcionario" do
        post funcionarios_url,
             params: { funcionario: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        valid_attributes
      }

      it "updates the requested funcionario" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario),
              params: { funcionario: new_attributes }, headers: valid_headers, as: :json
        funcionario.reload
        expect(funcionario.nome).to eq(new_attributes[:nome])
      end

      it "renders a JSON response with the funcionario" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario),
              params: { funcionario: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the funcionario" do
        funcionario = Funcionario.create! valid_attributes
        patch funcionario_url(funcionario),
              params: { funcionario: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested funcionario" do
      funcionario = Funcionario.create! valid_attributes
      expect {
        delete funcionario_url(funcionario), headers: valid_headers, as: :json
      }.to change(Funcionario, :count).by(-1)
    end
  end
end
