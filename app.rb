require 'sinatra'
require './lib/item'
require './lib/item_container'

get '/' do
  erb :index
end

get '/items' do
  filter = params[:filter]
  array_of_items = ItemContainer.new.list_of_items

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

get '/items/new' do
  erb :new
end

post '/items' do
  name = params[:name]
  items = ItemContainer.new
  items.add_menu_item(name)
  @displayed_items = items.list_of_items
  erb :items
end

get'/items/:id' do
  items = ItemContainer.new

  @id = params[:id]
  @foo = items.make_hash[@id.to_i]
  erb :id
end
