require 'rails_helper'

RSpec.describe "Lowquizzes", type: :request do
  describe "GET /lowquizs" do
    context "num is 1" do
      it "returns http success" do
        get "/quizs/1"
        expect(response).to have_http_status(:success)
      end
    end

    context "num is 5" do
      it "returns http success" do
        get "/lowquizs/5"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
