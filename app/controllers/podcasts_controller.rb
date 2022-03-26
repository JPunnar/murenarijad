class PodcastsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  before_action do
    ActiveStorage::Current.host = request.base_url if Rails.env.development?
  end

  def index
    @podcasts = Podcast.all.order(number: :desc)
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
    @podcast.increment!(:view_count)
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :number, :recording)
  end
end
