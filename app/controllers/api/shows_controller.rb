class Api::ShowsController < ApplicationController
  def read
    render json: {message: "Hi!"}
  end

end
