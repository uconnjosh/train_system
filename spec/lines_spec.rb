require 'spec_helper'

describe 'Lines' do
  it 'initializes an new instance of Lines' do
  test_line = Lines.new('Blue')
  test_line.should be_an_instance_of Lines
  end

  it 'tells you the name of the train line' do
    test_line = Lines.new('Blue')
    test_line.color.should eq 'Blue'
  end

  it 'starts off with no lines' do
    Lines.all.should eq []
  end

  it 'saves a new line to the database' do
    test_line = Lines.new('Blue')
    test_line.save
    Lines.all.should eq [test_line]
  end

  it 'saves multiple lines to the database' do
    test_line1 = Lines.new('Blue')
    test_line1.save
    test_line2 = Lines.new('Green')
    test_line2.save

    Lines.all.should eq [test_line1, test_line2]
  end

  it 'is the same train line if it is named the same thing' do
    test_line1 = Lines.new('Blue')
    test_line2 = Lines.new('Blue')
    test_line1.should eq test_line2
  end

  it 'deleted the current line' do
    test_line1 = Lines.new('Blue')
    test_line1.save
    test_line1.delete
    Lines.all.should eq []
  end
end
