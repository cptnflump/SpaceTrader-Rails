require 'rails_helper'

RSpec.describe "Agents", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/agents/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/agents/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/agents/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/agents/destroy"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/agents/create"
      expect(response).to have_http_status(:success)
    end
  end

end
