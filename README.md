# disk-optimizer

This simple Ruby program is designed to optimize your system's performance by identifying directories that meet specific criteria for potential deletion.

## Features

* Analyzes terminal commands and their outputs to identify directories that meet specific criteria
* User-defined criteria can include maximum directory size or other file attributes
* Simple and easy to use
* Tested with RSpec for maximum reliability

## Installation

To use this program, you'll need Ruby installed on your computer. Once you have Ruby installed, follow these steps:

1. Clone the repository to your local machine using `git clone https://github.com/AndyCodez/disk-optimizer.git`
2. Navigate to the program's directory using the command line
3. Run the program using the command `ruby disk-optimizer.rb`

## Usage

To use the program, create a text file containing the terminal commands used during file exploration. Save this file in the program's directory at `uploads/terminal_input.txt`.

Then, run the program and follow the prompts to specify the criteria for identifying directories. For example, you might specify that you only want to see directories that are not bigger than 12345 MB.

The program will quickly analyze the text file and identify any directories that meet your criteria.

## Contributing

Contributions are always welcome! If you have an idea for a new feature or improvement, feel free to submit a pull request.

## Testing

This program is thoroughly tested using RSpec to ensure maximum reliability. To run the tests, navigate to the program's directory and run the command `rspec spec/*`.

## License

This program is released under the MIT license. See LICENSE.md for more details.
