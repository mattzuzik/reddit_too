class LinksController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
    respond_with(@links)
  end

  def show
    respond_with(@link)
  end

  def new
    @link = Link.new
    respond_with(@link)
  end

  def edit
  end

  def create
    @link = Link.new(link_params)
    @link.save
    respond_with(@link)
  end

  def update
    @link.update(link_params)
    respond_with(@link)
  end

  def destroy
    @link.destroy
    respond_with(@link)
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url, :comment, :time_created, :expiration_date, :hx_votes)
    end
end
