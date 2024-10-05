require 'rails_helper'

RSpec.describe "Rankings", type: :request do
  describe "GET /index" do
    
    it "return a 200 response" do
      get "/rankings"
      expect(response).to have_http_status "200"
    end
  end
end
