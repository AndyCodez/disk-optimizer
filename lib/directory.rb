class Directory
    attr_accessor :name, :files, :size, :child_directories
    attr_reader :parent

    def initialize(name: , parent: "")
        @name = name
        @files = []
        @parent = parent
    end

    def valid?
        !@name.nil? && !@name.empty?
    end
end