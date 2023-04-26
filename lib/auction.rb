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

  def bidders
    bidder_names = []
    @items.each do |item|
      if item.bids != {}
        item.bids.each do |key, value|
          bidder_names << key.name
        end
      end
    end
    bidder_names
  end
end

def bidder_info
  require 'pry'; binding.pry
end

# bidder_info should return a hash with keys that are attendees, 
# and values that are a hash with that attendee's budget and 
# an array of items that attendee has bid on.