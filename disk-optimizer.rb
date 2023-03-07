require_relative 'lib/directory'
require_relative 'lib/file_explorer'

print 'Enter the maximum directory size in MB: '
max_size = gets.chomp.to_i

file_path = 'uploads/terminal_input.txt'

puts 'Processing...'

directories = FileExplorer.get_directories(file_path, max_size)

puts 'Done!'

puts "Here is a list of directories that are at most #{max_size} MB:"

directories.each do |key, val|
  puts "#{key}: #{val} MB"
end

total_size = FileExplorer.total_size(directories: directories)

puts "Their total size is #{total_size} MB"
