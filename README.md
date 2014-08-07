# Thru

Pipes a string through a shell command's STDIN and returns STDOUT.

## Installation

    gem install thru

## Usage

### Basic Usage

    require 'thru'
    text = "Hello world!"

    text.thru('uuencode -')
    # => "begin 644 -\n,2&5L;&\\@=V]R;&0A\n`\nend\n"

    text | 'uuencode -'
    # => "begin 644 -\n,2&5L;&\\@=V]R;&0A\n`\nend\n"


### Real-world Usage. Let's Convert Markdown to LaTeX!

Using [Pandoc](http://johnmacfarlane.net/pandoc/).

    markdown = File.read('README.md')
    latex    = markdown | 'pandoc -f markdown -t latex'


## API

### String#thru(*command) &rarr; str<br>str | command &rarr; str

Passes the string through a shell command's STDIN. Captures and returns its STDOUT.

Raises a `RuntimeError` if the command returned non-zero exit code.

    'wow' | 'gcc'
    # (STDERR) gcc: fatal error: no input files
    # (STDERR) compilation terminated.
    # RuntimeError: pid 93761 exit 1

To suppress the error, true!

    'wow' | 'gcc; true'
    # (STDERR) gcc: fatal error: no input files
    # (STDERR) compilation terminated.
    # => ""


## Contributing

1. Fork it ( https://github.com/dtinth/thru/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
