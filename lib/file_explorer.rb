class FileExplorer

    def self.parse_file_size(file_details)
        file_details.split(" ")[0].to_i
    end

    def self.calculate_directory_size(directory)
        return 0 if directory.child_directories.empty? && directory.files.empty?

        size_of_files = directory.files.map { |file_details| FileExplorer.parse_file_size(file_details) }.sum

        directory.child_directories.each do |directory|
            size_of_files += FileExplorer.calculate_directory_size(directory)
        end

        size_of_files
    end

end