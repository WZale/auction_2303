require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'can initialize with readable attributes' do
    expect(@attendee.name).to eq('Megan')
    expect(@attendee.budget).to eq(50)
  end
end