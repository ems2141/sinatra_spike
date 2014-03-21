require 'sinatra'
require './lib/item'
require './lib/item_container'

get '/' do
  erb :index
end

get '/items' do
  filter = params[:filter]
  array_of_items = ItemContainer.new.menu

  @displayed_items = []
  array_of_items.each do |item|
    if item.name.downcase.include? filter.to_s
      @displayed_items << item
    end
  end

  if @displayed_items.empty?
    @displayed_items = array_of_items
  end
  erb :items
end

