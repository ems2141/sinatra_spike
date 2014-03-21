
class ItemContainer
  attr_accessor :list_of_items

  def initialize
    @list_of_items=
      [Item.new(1, "Spinach"),
       Item.new(2, "Chicken"),
       Item.new(3, "Asparagus")]
    @list_of_items
  end

  def add_menu_item(item)
    new_item = Item.new(@list_of_items.length+1, item)
    @list_of_items << new_item
  end
end