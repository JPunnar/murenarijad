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
    redirect_to podcast
  end

  def show
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :recording)
  end
end
