require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /cats" do
    it "gets a list of Cats" do
      Cat.create(name: 'Felix', age: 2, enjoys: 'Long naps on the couch', image: 'url_of_cat_image')

      get '/cats'

      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
    end
  end
end
``