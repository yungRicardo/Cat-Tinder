require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of Cats" do
      Cat.create(name: 'Felix', age: 2, enjoy: 'Long naps on the hammock', image: 'https://unsplash.com/photos/a-close-up-of-a-cat-with-its-mouth-open-qQgOMo4vpnU')

      get '/cats'

      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
    end
  end
end
