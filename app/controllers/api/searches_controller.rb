class Api::SearchesController < ApplicationController
  def search
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
