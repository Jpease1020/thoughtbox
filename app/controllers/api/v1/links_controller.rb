class Api::V1::LinksController < Api::ApiController
  respond_to :json
  def index
    respond_with current_user.links.all
  end

  def create
    link = Link.create(link_params)
    link.user_id = current_user.id
    link.save
    respond_with :api, :v1, link
  end

  def update
    if params[:change]
      link = Link.find(params[:id])
      link.update_attributes(read: !link.read)
      render json: link
    else
      link = Link.find(params[:id])
      link.update(link_params)
      render json: link
    end
  end

  private

  def link_params
    params.permit(:title, :url, :change)
  end
end
