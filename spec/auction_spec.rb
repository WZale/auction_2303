require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before(:each) do
    @auction = Auction.new

    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')

    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  it 'can initialize with readable attributes' do
    expect(@auction.items).to eq([])
  end

  it 'has an add_items method' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1, @item2])
  end

  it 'has an unpopular_items method' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    
    @item4.add_bid(@attendee3, 50)

    expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])

    @item3.add_bid(@attendee2, 15)

    expect(@auction.unpopular_items).to eq([@item2, @item5])
  end

  it 'has a potential revenue method' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)

    expect(@auction.potential_revenue).to eq(87)
  end

  it 'has a bidders method' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    
    @item4.add_bid(@attendee3, 50)

    expect(@auction.bidders).to eq([@attendee2.name, @attendee1.name, @attendee3.name])
  end

  it 'has a bidder_info method' do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)

    @item1.add_bid(@attendee2, 20)
    @item1.add_bid(@attendee1, 22)
    
    @item4.add_bid(@attendee2, 40)
    @item4.add_bid(@attendee3, 50)

    expected = {
                @attendee1 =>
                              {
                                :budget => 50,
                                :items => [@item1]
                              },
                @attendee2 =>
                              {
                                :budget => 75,
                                :items => [@item1, @item4]
                              },
                @attendee3 =>
                              {
                                :budget => 100,
                                :items => [@item4]
                              }
                }
  
    expect(@auction.bidder_info).to eq(expected)
  end   
end