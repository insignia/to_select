module ToSelect
  module ActiveRecordExtensions
    def to_select(text_method=:name, conditions=nil)
      find(:all, :conditions => conditions).to_select(text_method)
    end
  end
end
ActiveRecord::Base.extend ToSelect::ActiveRecordExtensions
