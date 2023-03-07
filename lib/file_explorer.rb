class FileExplorer
  def self.parse_size(details)
    details.split(' ')[0].to_i
  end

  def self.calculate_size(directory)
    return 0 if directory.child_directories.empty? && directory.files.empty?

    file_size = directory.files.map { |file_details| FileExplorer.parse_size(file_details) }.sum

    directory.child_directories.each do |directory|
      file_size += calculate_size(directory)
    end

    file_size
  end

  def self.get_directories(file_path, max_size)
    directories = {}

    current_directory = parent_directory = Directory.new(name: '/')

    File.foreach(file_path) do |line|
      if line.start_with?('$ cd')
        current_directory, parent_directory = change_directory(current_directory, line, parent_directory)
      else
        if line.start_with?('dir')
          create_directory(line, parent_directory)
        elsif is_file?(line)
          parent_directory.files << line
        end

        check_directory_size(current_directory, directories, max_size, parent_directory)
      end
    end

    directories
  end

  def self.bfs(head_directory, directory_name)
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

  def self.total_size(directories: {})
    directories.values.sum
  end

  def self.is_file?(line)
    line.split(' ')[0] != '$' && Integer(line.split(' ')[0])
  end

  def self.create_directory(line, parent_directory)
    directory_name = line.split(' ')[-1]

    new_directory = Directory.new(name: directory_name, parent: parent_directory)

    parent_directory.child_directories << new_directory
  end

  def self.change_directory(current_directory, line, parent_directory)
    if line.split(' ')[-1] == '..'
      # Go back
      current_directory = current_directory.parent
    elsif line.split(' ')[-1] != '/'
      directory_name = line.split(' ')[-1]

      current_directory = Directory.new(name: directory_name, parent: parent_directory)

      current_directory = bfs(current_directory, directory_name)

      parent_directory = current_directory
    end
    [current_directory, parent_directory]
  end

  def self.check_directory_size(current_directory, directories, max_size, parent_directory)
    size = FileExplorer.calculate_size(parent_directory)

    directories[current_directory.name] = size if size > 0 && size <= max_size
  end
end
