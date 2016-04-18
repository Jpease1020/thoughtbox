class Api::V1::LinksController < < Api::ApiController
  respond_to :json
  def index
    respond_with Link.all
  end
end
