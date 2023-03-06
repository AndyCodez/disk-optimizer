class FileExplorer

    def self.parse_file_size(file_details)
        file_details.split(" ")[0].to_i
    end
end