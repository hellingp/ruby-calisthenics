# Create a class called Dessert
class Dessert
    def initialize(name, calories)
        @name = name
        @calories = calories
    end
    attr_accessor :name
    attr_accessor :calories
    def healthy?
        if @calories < 200
            return true
        end
        return false
    end
    def delicious?
        return true
    end
end

class JellyBean < Dessert
    def initialize(flavor)
        @flavor = flavor
        @name = flavor + " jelly bean"
        @calories = 5
    end
    def delicious?
        super
        if @flavor != "licorice"
            return true
        else
            return false
        end
    end
end
