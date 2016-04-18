class Api::V1::LinksController < Api::ApiController
  respond_to :json
  def index
    respond_with Link.all
  end

  def create
    respond_with :api, :v1, Link.create(link_params)
  end


  private

  def link_params
    params.permit(:title, :url)
  end
end
