class LandmarksController < ApplicationController


  get '/' do
      erb :'/landmarks/new'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params[:landmark])
    erb :'/landmarks/show'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
      erb :'/landmarks/index'
  end

   get "/landmarks/:id" do
      @landmark = Landmark.lookup(params[:id])
        erb :'/landmarks/show'
   end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.lookup(params[:id])
      erb :'/landmarks/edit'
  end

  patch "/landmarks/:id" do
    @landmark = Landmark.lookup(params[:id])
     @landmark.update(params[:landmark])
     @landmark.save
      erb :"/landmark/#{@landmark.id}"
  end


end
