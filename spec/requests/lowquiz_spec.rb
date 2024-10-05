require 'rails_helper'

RSpec.describe "Lowquizzes", type: :request do
  describe "GET /lowquizs" do
    context "num is 1" do
      it "returns http success" do
        get "/quizs/1"
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response["quiz"].length).to eq(1)
      end
    end

    context "num is 5" do
      it "returns http success" do
        get "/lowquizs/5"
        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response["quiz"].length).to eq(5)
      end
    end
  end
end
