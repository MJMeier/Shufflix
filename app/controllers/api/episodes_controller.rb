class Api::EpisodesController < ApplicationController


  def random
    selection = params[:id]

    season = Nokogiri::HTML(open("https://instantwatcher.com/title/" + selection + "?source=1%202%203&view=synopsis&infinite=on&_pjax=%23filters-plus-results&content_type=1%202"))


    count = 0
    blocks = []
    season.css(".iw-title.netflix-title.list-title").each do |node|
      blocks<<node.to_html
      count += 1
    end
    
    prng = Random.new
    ep = prng.rand(1..count)
    selection = blocks[ep]

    render json: { watch: selection }

  end

end
