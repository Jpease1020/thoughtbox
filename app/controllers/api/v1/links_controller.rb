class Api::V1::LinksController < Api::ApiController
  respond_to :json
  def index

    respond_with Link.all
  end

  def create
    respond_with :api, :v1, Link.create(link_params)
  end

  def update
    if params[:change]
      link = Link.find(params[:id])
      link.update_attributes(read: !link.read)
      render json: link
    else
      link = Link.find(params[:id])
      link.update_attributes(link_params)
      render json: link
    end
  end

  private

  def link_params
    params.permit(:title, :url, :change)
  end
end
