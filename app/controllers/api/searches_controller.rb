class Api::SearchesController < ApplicationController
  def search
    results = params["text"]
    doc = Nokogiri::HTML(open("https://instantwatcher.com/search?source=1+2+3&q=" + results + "&sort=queue_count+desc&view=synopsis&infinite=on&content_type%5B%5D=1&content_type%5B%5D=2"))

    # arr = []
    # # needs to be hash of show and number
    # doc.css(".title-link").each do |link|
    #   if link.text != ""
    
    #     arr.push(title: link.text, id: link.values[-1], visible: false)

    #   end
    # end

    base = "https://instantwatcher.com"

    arr = []
    doc.css(".iw-title").each do |link|
      arr.push(
        title: link.child.next_element.text, 
        # THIS IS HOW YOU GRAB THE PIC! WE DON'T NEED REGEX!!!
        pic: base + link.child.child.attributes["src"].value,
        id: link.child.next_element.child.attributes["data-title-id"].value,
        visible: false
        )
    end

    render json: {results: arr}
  end

end
