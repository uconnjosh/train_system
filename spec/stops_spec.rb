require 'spec_helper'

describe 'Stops' do
  it 'initializes a new instance of stops' do
    new_stop = Stops.new(1, 1)
    new_stop.should be_an_instance_of Stops
  end

  it 'is the same stop if it has the same station-line ids' do
    new_stop1 = Stops.new(1, 1)
    new_stop2 = Stops.new(1, 1)
    new_stop1.should eq new_stop2
  end

  it 'starts off with no station - line pair' do
    new_stop = Stops.new(1, 1)
    Stops.all.should eq []
  end

  it 'lets you save to the database' do
    new_stop = Stops.new(1, 1)
    new_stop.save
    Stops.all.should eq [new_stop]
  end
end



