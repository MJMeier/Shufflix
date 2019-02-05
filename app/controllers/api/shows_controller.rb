class Api::ShowsController < ApplicationController
  def read
    render json: {message: "Hello!"}
  end

end
