class FileExplorer
  def self.parse_file_size(file_details)
    file_details.split(' ')[0].to_i
  end

  def self.calculate_directory_size(directory)
    return 0 if directory.child_directories.empty? && directory.files.empty?

    size_of_files = directory.files.map { |file_details| FileExplorer.parse_file_size(file_details) }.sum

    directory.child_directories.each do |directory|
      size_of_files += FileExplorer.calculate_directory_size(directory)
    end

    size_of_files
  end

  def self.get_directories(file_path, max_size)
    directories = {}

    current_directory = parent_directory = Directory.new(name: '/')

    File.foreach(file_path) do |line|
      if line.start_with?('$ cd')
        if line.split(' ')[-1] == '..'
          # Go back
          current_directory = current_directory.parent
        elsif line.split(' ')[-1] != '/'
          directory_name = line.split(' ')[-1]

          current_directory = Directory.new(name: directory_name, parent: parent_directory)

          current_directory = bfs(current_directory, directory_name)

          parent_directory = current_directory
        end
      else
        if line.start_with?('dir')
          directory_name = line.split(' ')[-1]

          new_directory = Directory.new(name: directory_name, parent: parent_directory)

          parent_directory.child_directories << new_directory

        elsif line.split(' ')[0] != '$' && Integer(line.split(' ')[0])
          # Is a file
          parent_directory.files << line
        end

        size = FileExplorer.calculate_directory_size(parent_directory)

        directories[current_directory.name] = size if size > 0 && size <= max_size
      end
    end

    directories
  end
end

def bfs(head_directory, directory_name)
  queue = []

  queue.push(head_directory)

  until queue.empty?
    current_directory = queue.shift

    next if current_directory.visited

    current_directory.visited = true

    return current_directory if current_directory.name == directory_name

    queue.push(*current_directory.child_directories)

  end

  -1
end
