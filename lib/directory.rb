class Directory
    attr_accessor :name

    def initialize(name: )
        @name = name
    end

    def valid?
        !@name.nil? && !@name.empty?
    end
end