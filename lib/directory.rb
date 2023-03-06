class Directory
  attr_accessor :name, :files, :size, :child_directories, :visited
  attr_reader :parent

  def initialize(name:, parent: '')
    @name = name
    @files = []
    @parent = parent
    @child_directories = []
  end

  def valid?
    !@name.nil? && !@name.empty?
  end
end
