module ActiveRecord
  class Base
  end
end

require File.dirname(__FILE__) + '/../lib/active_record_extensions.rb'

describe ActiveRecord::Base do

  before :each do
    m1, m2 = mock('model1'), mock('model2')
    m1.stub!(:id).and_return(1)
    m1.stub!(:name).and_return('model1')
    m1.stub!(:some_field).and_return('some_field1')
    m2.stub!(:id).and_return(2)
    m2.stub!(:name).and_return('model2')
    m2.stub!(:some_field).and_return('some_field2')
    @records = [m1, m2]
  end

  describe 'with no conditions' do

    it "should return a new array with [name, id] touples" do
      ActiveRecord::Base.should_receive(:find).with(:all, :conditions => nil).and_return(@records)
      ActiveRecord::Base.to_select == [['model1', 1], ['model2', 2]]
    end

    it "should return a new array with [some_field, id] touples" do
      ActiveRecord::Base.should_receive(:find).with(:all, :conditions => nil).and_return(@records)
      ActiveRecord::Base.to_select(:some_field) == [['some_field1', 1], ['some_field2', 2]]
    end

  end

  it "should return a new array with [some_field, id] touples with the records filtered by some_condition" do
    ActiveRecord::Base.should_receive(:find).with(:all, :conditions => 'some_condition').and_return(@records)
    ActiveRecord::Base.to_select(:some_field, :conditions => 'some_condition') == [['some_field1', 1], ['some_field2', 2]]
  end

  it "should return a new array with [some_field, id] touples plus a default option" do
    ActiveRecord::Base.should_receive(:find).with(:all, :conditions => nil).and_return(@records)
    ActiveRecord::Base.to_select(:some_field, :default => 'None') == [['None', nil], ['some_field1', 1], ['some_field2', 2]]
  end

end
