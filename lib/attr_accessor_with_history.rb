class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
        if !defined? @#{attr_name}_history
          puts "first time"
          @#{attr_name}_history = [@#{attr_name}]
        else
          @#{attr_name}_history << @#{attr_name}
        end
        @#{attr_name} = value
      end
    }
  end
end

class Foo 
  attr_accessor_with_history :bar
end

class Main
  f = Foo.new
  puts "history should be 1 nil"
  puts f.bar_history
  f.bar = 'x'
  puts "history should still be 1 nil"
  puts f.bar_history
  f.bar = 'y'
  puts "history should be nill, x"
  puts f.bar_history
  f.bar = 'z'
  puts f.bar_history
end
