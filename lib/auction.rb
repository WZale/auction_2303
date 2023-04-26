class Auction
  attr_reader :items

  def initialize()
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map { |item| item.name }
  end

  def unpopular_items
    @items.find_all { |item| item.bids == {} }
  end

  def potential_revenue
    all_items = []
    @items.each do |item| 
      all_items << item.current_high_bid if item.current_high_bid != nil
    end
    all_items.sum
  end
end