require 'rails_helper'

RSpec.describe "Cats", type: :request do

  describe "GET /cats" do
    it "gets a list of Cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Long naps on the couch',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        )

      # Make a request
      get '/cats'

      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
    end
  end

  describe "POST /cats" do
    it "creates a new cat" do
      cat_params = {
        cat: {
          name: 'Binx', age: 1, enjoys: 'Playing with shadows.', image: 'another_cat_image_url'
        }
      }

      post '/cats', params: cat_params

      expect(response).to have_http_status(:created)
      expect(Cat.last.name).to eq('Binx')
    end
 
    context 'when the cat has invalid attributes' do
      it 'returns status code 422' do
        post '/cats', params: { cat: { name: '', age: '', enjoys: 'Sleep', image: '' } }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH /cats/:id" do
    let!(:cat) { Cat.create(name: 'Mittens', age: 2, enjoys: 'Sunshine and warm spots', image: 'yet_another_cat_image_url') }

    context 'when the cat has invalid attributes' do
      let(:invalid_attributes) { { name: '', age: nil, enjoys: 'Eat', image: ''} }

      it "updates a cat's information" do
        updated_params = { cat: { name: 'Mittens II' } }
        patch "/cats/#{cat.id}", params: updated_params
        cat.reload

        expect(response).to have_http_status(:ok)
        expect(cat.name).to eq('Mittens II')
      end



      it 'returns a status code 422' do
        patch cat_path(cat), params: { cat: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    

      it 'returns a validation failure message' do
        patch cat_path(cat), params: { cat: invalid_attributes }
        expect(response.body).to match(/can't be blank/)
        expect(response.body).to match(/is too short/)
      end
    end
      
  end

  describe "DELETE /cats/:id" do
    let!(:cat) { Cat.create(name: 'Shadow', age: 5, enjoys: 'Stalking in the night.', image: 'shadow_cat_image_url') }
    it "deletes a cat" do
      expect {
        delete "/cats/#{cat.id}"
      }.to change(Cat, :count).by(-1)

      expect(response).to have_http_status(:no_content)
    end
  end

  it "doesn't create a cat without a name" do
    cat_params = {
      cat: {
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    # Send the request to the  server
    post '/cats', params: cat_params
    # expect an error if the cat_params does not have a name
    expect(response.status).to eq 422
    # Convert the JSON response into a Ruby Hash
    json = JSON.parse(response.body)
    # Errors are returned as an array because there could be more than one, if there are more than one validation failures on an attribute.
    expect(json['name']).to include "can't be blank"
  end


end
