class Api::ShowsController < ApplicationController
  def read

    # need to add params functionality
    doc = Nokogiri::HTML(open('https://instantwatcher.com/search?source=1+2+3&q=parks+and+recreation&sort=queue_count+desc&view=synopsis&infinite=on&content_type%5B%5D=1&content_type%5B%5D=2'))

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




    render json: {message: arr}
# p doc.css(".item-group-container")

#  THIS WORKS FOR SEARCH RESULTS!
# also gets the value that you'll need to get the season ID for URL
    # doc.css(".title-link").each do |link|
    #   if link.text != ""
    #     p "TITLE: "
    #     p link.text
    #     p "STUFF: "
    #     p link.values[-1]
    #     p "---------"
    #     p "----------"
    #   end
    # end


  end

end
