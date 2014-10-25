class LinksController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]





  def index
    @links = Link.all
    respond_with(@links)
  end

  def show
    respond_with(@link)
  end

  def new
    @link = current_user.links.build
    respond_with(@link)
  end

  def edit
  end

  def create
    @link = current_user.links.build(link_params)
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

    def correct_user 
      @link = current_user.links.find_by(id: params[:id])
      redirect_to links_path, notice: 'nope- not authorized' if @link.nil?
    end

    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:title, :url, :comment, :time_created, :expiration_date, :hx_votes, :image)
    end
end
