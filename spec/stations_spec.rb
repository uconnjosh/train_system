require 'spec_helper'

describe 'Stations' do
  it 'initializes a new instance of stations' do
    test_station = Stations.new('5th and Alder')
    test_station.should be_an_instance_of Stations
  end

  it 'tells you the name of the station' do
    test_station = Stations.new('5th and Alder')
    test_station.location.should eq '5th and Alder'
    end

  it 'starts off with no stations' do
    Stations.all.should eq []
  end

  it 'lets you save stations to the database' do
    test_station1 = Stations.new('5th and Alder')
    test_station1.save
    test_station2 = Stations.new('North Prescott')
    test_station2.save

    Stations.all.should eq [test_station1, test_station2]
  end

  it 'is the same station if it has the same location name' do
    test_station1 = Stations.new('5th and Alder')
    test_station2 = Stations.new('5th and Alder')
    test_station1.should eq test_station2
  end

  it 'deleted the current station' do
    test_station1 = Stations.new('5th and Alder')
    test_station1.save
    test_station1.delete
    Stations.all.should eq []
  end

# end

#   describe 'find_lines' do
#     it 'Finds all the lines that stop at a certain station' do
#       test_station1 = Stations.new('5th and Alder')
#       test_station1.save
#       test_line1 = Lines.new('Blue')
#       test_line1.save
#       test_station1.find_lines.should eq ['Blue']
#     end
end


