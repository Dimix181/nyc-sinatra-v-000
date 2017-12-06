
class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures/new' do
    @figure = Figure.new(params[:figure])

    if !params[:title][:name].empty?
      @figure.titles << Title.new(params[:title])
    end

    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.new(params[:landmark])
    end
      @figure.save
      redirect to :"/figures/#{@figure.slug}"
  end

  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/:slug' do
    @figure = Figure.lookup(params[:slug])
    erb :'/figures/show'
  end

  get '/figures/:slug/edit' do
    @figure = Figure.lookup(params[:slug])
    erb :"/figures/edit"
  end

  patch '/figures/:slug' do

      @figure = Figure.lookup(params[:slug])
      @figure.name = params[:figure][:name]
     @figure.landmarks << Landmark.new(name: params[:new_landmark])

     @figure.save
    redirect to "/figures/#{@figure.id}"
   end

end
