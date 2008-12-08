module ToSelect
  module Array
    def to_select(text_method = :name, options = {})
      list = self.map { |x| [x.send(text_method), x.id] }
      list.unshift [options[:default], nil] if options[:default]
      list
    end
  end
end
Array.send :include, ToSelect::Array
