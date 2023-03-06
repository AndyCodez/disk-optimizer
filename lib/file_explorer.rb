class FileExplorer

    def self.parse_file_size(file_details)
        file_details.split(" ")[0].to_i
    end

    def self.calculate_directory_size(directory)
        directory.files.map { |file_details| FileExplorer.parse_file_size(file_details) }.sum
    end
end