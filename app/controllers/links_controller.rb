class LinksController < ApplicationController

  def new
    @link = Link.new
  end

  def index
    @links = Link.all
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      flash[:notice] = "Link Created"
      redirect_to links_path
    else
      flash.now[:error] = "Invalid Link"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
