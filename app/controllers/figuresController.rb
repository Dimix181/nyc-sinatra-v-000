class FiguresController < ApplicationController

  get '/figures/new' do

    erb :'/figures/new'
  end

  post '/figures/new' do
    figure = Figure.new(name: params[:figure][:name])
    figure.titles << Title.find(params[:figure][:title_ids].first.to_i)
    figure.save
  end

end
