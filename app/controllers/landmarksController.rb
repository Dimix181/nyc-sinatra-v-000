class LandmarksController < ApplicationController


  get '/' do
    binding.pry
      erb :'landmarks/new'
  end


end
