module ToSelect
  module ActiveRecordExtensions
    def to_select(text_method=:name, options = {})
      list = find(:all, :conditions => options[:conditions]).to_select(text_method)
      list << [options[:default], nil] if options[:default]
      list
    end
  end
end
ActiveRecord::Base.extend ToSelect::ActiveRecordExtensions
