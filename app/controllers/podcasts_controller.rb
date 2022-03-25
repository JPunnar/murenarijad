class PodcastsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @podcasts = Podcast.all
  end

  def new
    @podcast = Podcast.new
  end

  def create
    podcast = Podcast.create(podcast_params)
    redirect_to podcasts_path
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :number, :recording)
  end
end
