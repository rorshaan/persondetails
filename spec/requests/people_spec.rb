require 'rails_helper'

RSpec.describe PeopleController, type: :controller do
  let(:person) { FactoryBot.create(:person) }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    
    it "returns a success response" do
      get :show, params: { id: person.to_param }
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
  
    it "returns a success response" do
      get :edit, params: { id: person.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do

      it "creates a new Person" do
        expect {
          post :create, params: { person: {
            title: "Mr.", name: "Some One", Age: 56 
          } }
        }.to change(Person, :count).by(1)
      end

      it "redirects to the created person" do
        post :create, params: { person: {
            title: "Mr.", name: "Jack sparrow", Age: 56 
          }  }
        expect(response).to redirect_to(person_url(Person.last))
      end
    end

  end

  describe "PUT #update" do
    
    context "with valid params" do
      let(:new_attributes) { { name: "Updated Name" } }

      it "updates the requested person" do
        put :update, params: { id: person.to_param, person: new_attributes }
        person.reload
        expect(person.name).to eq("Updated Name")
      end

      it "redirects to the person" do
        put :update, params: { id: person.to_param, person: new_attributes }
        expect(response).to redirect_to(person_url(person))
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { { name: nil } }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: { id: person.to_param, person: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:person) { FactoryBot.create(:person) }

    it "destroys the requested person" do
      expect {
        delete :destroy, params: { id: person.to_param }
      }.to change(Person, :count).by(-1)
    end

    it "redirects to the people list" do
      delete :destroy, params: { id: person.to_param }
      expect(response).to redirect_to(root_path)
    end
  end
end
