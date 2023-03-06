require_relative '../lib/file_explorer'

describe FileExplorer do 

    describe ".parse_file_size" do
        it "returns the size of the file in integer format" do
            file_size = FileExplorer.parse_file_size("12345 a.txt")
            expect(file_size).to eq(12345)

            file_size2 = FileExplorer.parse_file_size("902345 a.txt")
            expect(file_size2).to eq(902345)
        end
    end

end