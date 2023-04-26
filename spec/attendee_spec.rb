require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do
    @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
  end

  it 'can initialize with readable attributes' do
    expect(@attendee1.name).to eq('Megan')
    expect(@attendee1.budget).to eq(50)
  end
end