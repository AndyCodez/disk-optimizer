class Directory
    attr_accessor :name, :files

    def initialize(name: )
        @name = name
        @files = []
    end

    def valid?
        !@name.nil? && !@name.empty?
    end
end