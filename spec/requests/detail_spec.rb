require 'rails_helper'

RSpec.describe DetailsController, type: :controller do
  let(:person) { FactoryBot.create(:person) }
  let(:valid_attributes) { FactoryBot.create(:detail, person_id: person.id) }
  let(:invalid_attributes) { FactoryBot.create(:detail, email: nil, person_id: person.id) }
  let(:detail) { FactoryBot.create(:detail, person_id: person.id) }

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: { person_id: person.id }
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { person_id: person.id, id: detail.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Detail" do
        expect {
          post :create, params: { person_id: person.id, detail: {
            email: "test@ruby.com", phone: "9090901234", person_id: person.id
          } }
        }.to change(Detail, :count).by(1)
      end

      it "redirects to the people path" do
        post :create, params: { person_id: person.id, detail: {
            email: "test@ruby.com", phone: "9090901234", person_id: person.id
          }  }
        expect(response).to redirect_to(person_path(person))
      end
    end

    context "with invalid params" do
      it "does not create a new Detail" do
       
        post :create, params: { person_id: person.id, id: detail.id, detail: {
        email: nil
        } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { email: "new_email@example.com" } }

      it "updates the requested detail" do
        put :update, params: {person_id: person.id, id: detail.id, detail: new_attributes }
        detail.reload
        expect(detail.email).to eq("new_email@example.com")
      end

      it "redirects to the detail" do
        put :update, params: { person_id: person.id, id: detail.id, detail: {
          email: "newemail1@test.com"
        } }
        expect(response).to redirect_to(person_path(person))
      end
    end

    context "with invalid params" do
      it "renders the 'edit' template" do
        put :update, params: { person_id: person.id, id: detail.id, detail: {
        email: nil
        } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested detail" do
      detail
      expect {
        delete :destroy, params: { person_id: person.id, id: detail.id }
      }.to change(Detail, :count).by(-1)
    end

    it "redirects to the details list" do
      delete :destroy, params: {person_id: person.id, id: detail.id }
      expect(response).to redirect_to(person_url)
    end
  end
end
