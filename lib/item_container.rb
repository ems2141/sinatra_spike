
class ItemContainer
  attr_accessor :list_of_items, :hash_menu_items

  def initialize
    @list_of_items=
      [Item.new(1, "Spinach"),
       Item.new(2, "Chicken"),
       Item.new(3, "Asparagus")]
    @list_of_items
    @hash_menu_items = {}
  end

  def add_menu_item(item)
    new_item = Item.new(@list_of_items.length+1, item)
    @list_of_items << new_item
    #@hash_menu_items[new_item.id] = new_item.name
    make_hash
  end

  def make_hash
    @list_of_items.each do |item|
      @hash_menu_items[item.id] = item.name
    end
    @hash_menu_items
  end
end