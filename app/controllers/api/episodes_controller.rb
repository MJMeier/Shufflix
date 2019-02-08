class Api::EpisodesController < ApplicationController

  # ids to use. will be sent over from FE
  # 80021755
  # 80067702
  # 80170693

  def random
    selection = params[:id]

    season = Nokogiri::HTML(open("https://instantwatcher.com/title/" + selection + "?source=1%202%203&view=synopsis&infinite=on&_pjax=%23filters-plus-results&content_type=1%202"))

    # THIS GETS ALL EPISODE TITLES AND EPISODE COUNT!
    count = 0
    season.css(".episode-title").each do
      # p node.text
      count += 1
    end
    # p "TOTAL EPISODES:"
    # p count

    prng = Random.new
    ep = prng.rand(1..count)

    render json: {watch_episode: ep}

  end

end
