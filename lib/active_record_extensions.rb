module ToSelect
  module ActiveRecordExtensions
    def to_select(text_method=:name, options = {})
      find(:all, :conditions => options[:conditions]).to_select(text_method, options)
    end
  end
end
ActiveRecord::Base.extend ToSelect::ActiveRecordExtensions
