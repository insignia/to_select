require File.dirname(__FILE__) + '/../lib/array.rb'

describe Array do

  before do
    m1, m2 = mock('model1'), mock('model2')
    m1.stub!(:id).and_return(1)
    m1.stub!(:name).and_return('model1')
    m1.stub!(:some_field).and_return('some_field1')
    m2.stub!(:id).and_return(2)
    m2.stub!(:name).and_return('model2')
    m2.stub!(:some_field).and_return('some_field2')
    @records = [m1, m2]
  end

  it "should return a new array with [name, id] touples" do
    @records.to_select.should == [['model1', 1], ['model2', 2]]
  end

  it "should return a new array with [some_field, id] touples" do
    @records.to_select(:some_field).should == [['some_field1', 1], ['some_field2', 2]]
  end

  it "should return a new array with [some_field, id] touples plus a default option" do
    @records.to_select(:some_field, :default => 'None').should == [['None', nil], ['some_field1', 1], ['some_field2', 2]]
  end

end