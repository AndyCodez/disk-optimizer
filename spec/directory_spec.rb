require_relative '../lib/directory'

describe Directory do
  context 'when creating a new object' do
    it 'fails if the :name is absent' do
      invalid_dir = Directory.new(name: nil)
      expect(invalid_dir).not_to be_valid
    end

    it 'succeeds if the :name is present' do
      valid_dir = Directory.new(name: 'Sample directory')
      expect(valid_dir).to be_valid
    end
  end

  it 'can contain files' do
    dir = Directory.new(name: 'Sample directory')
    dir.files = ['file1.txt']
  end

  it 'can have a parent directory' do
    parent_dir = Directory.new(name: 'Parent directory')
    child_dir = Directory.new(name: 'Child directory', parent: parent_dir)

    expect(child_dir.parent).to eq(parent_dir)
  end

  it 'can have child directories' do
    parent_dir = Directory.new(name: 'Parent directory')
    child_dir1 = Directory.new(name: 'Child directory', parent: parent_dir)
    child_dir2 = Directory.new(name: 'Child directory', parent: parent_dir)

    parent_dir.child_directories = [child_dir1, child_dir2]

    expect(parent_dir.child_directories.count).to eq(2)
  end
end
