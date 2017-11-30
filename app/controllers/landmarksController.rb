class LandmarksController < ApplicationController


  get '/' do
      erb :'landmarks/new'
  end


end
