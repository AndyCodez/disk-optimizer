class Directory
    attr_reader :name

    def initialize(name: )
        @name = name
    end

    def valid?
        !@name.nil? && !@name.empty?
    end
end