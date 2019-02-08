class Api::ShowsController < ApplicationController
  def read

    # need to add params functionality
    doc = Nokogiri::HTML(open('https://instantwatcher.com/search?source=1+2+3&q=breaking+bad&sort=queue_count+desc&view=synopsis&infinite=on&content_type%5B%5D=1&content_type%5B%5D=2'))

    arr = []
    # needs to be hash of show and number
    doc.css(".title-link").each do |link|
      if link.text != ""
        # p "TITLE: "
        arr.push(link.text)
        # p "STUFF: "
        # p link.values[-1]
        # p "---------"
        # p "----------"
      end
    end

    # render json: {message: arr}

    season = Nokogiri::HTML(open('https://instantwatcher.com/title/70135214?source=1%202%203&q=the%20office&view=synopsis&infinite=on&_pjax=%23filters-plus-results&content_type=1%202'))

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

  def season
    results = params["text"]
    doc = Nokogiri::HTML(open("https://instantwatcher.com/search?source=1+2+3&q=" + results + "&sort=queue_count+desc&view=synopsis&infinite=on&content_type%5B%5D=1&content_type%5B%5D=2"))

    arr = []
    # needs to be hash of show and number
    doc.css(".title-link").each do |link|
      if link.text != ""
    
        arr.push(title: link.text, id: link.values[-1])

      end
    end

    render json: {results: arr}
  end

end
