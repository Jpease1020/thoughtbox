class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def index
    @links = Link.all
  end

  def create
    link = Link.new(link_params)
    link.user_id = current_user.id
    if link.save
      flash[:notice] = "Link Created"
      redirect_to links_path
    else
      flash[:error] = "Invalid Link"
      redirect_to links_path
    end
  end

  def update
    link = Link.find(params[:id])
    link.update_attributes(link_params)
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
