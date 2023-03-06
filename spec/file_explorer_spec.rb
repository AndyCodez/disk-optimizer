require_relative '../lib/file_explorer'
require_relative '../lib/directory'

describe FileExplorer do
  describe '.parse_file_size' do
    it 'returns the size of the file in integer format' do
      file_size = FileExplorer.parse_file_size('12345 a.txt')
      expect(file_size).to eq(12_345)

      file_size2 = FileExplorer.parse_file_size('902345 a.txt')
      expect(file_size2).to eq(902_345)
    end
  end

  describe '.calculate_directory_size' do
    it 'returns the total size of the files in the directory' do
      directory = Directory.new(name: 'Test dir')
      directory.files = ['10 file1.txt', '20 file2.txt']

      expect(FileExplorer.calculate_directory_size(directory)).to eq(30)
    end

    it 'calculates the total size of all the direct files + nested files in the directory' do
      parent_directory = Directory.new(name: 'Test dir')
      parent_directory.files = ['10 file1.txt', '20 file2.txt']

      child_directory = Directory.new(name: 'Child dir', parent: parent_directory)
      child_directory.files = ['30 file1.txt', '10 file2.txt']

      parent_directory.child_directories << child_directory

      expect(FileExplorer.calculate_directory_size(parent_directory)).to eq(70)
    end
  end

  describe '.get_directories' do
    it 'returns a hash table of directories' do
      file_path = 'spec/fixtures/sample_input.txt'
      max_size = 100_000

      directories = FileExplorer.get_directories(file_path, max_size)

      expect(directories.class).to eq(Hash)
    end

    it 'returns directories that are at most the set maximum size' do
      file_path = 'spec/fixtures/sample_input.txt'
      max_size = 100_000

      directories = FileExplorer.get_directories(file_path, max_size)

      expect(directories.count).to eq(2)

      expect(directories.keys.first).to eq('a')
      expect(directories.values.first).to be < max_size

      expect(directories.keys.last).to eq('e')
      expect(directories.values.last).to be < max_size
    end
  end
end
