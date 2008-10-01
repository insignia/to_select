module ToSelect
  module Array
    def to_select(text_method=:name)
      self.collect { |x| [x.send(text_method),x.id] }
    end
  end
end
Array.send :include, ToSelect::Array
