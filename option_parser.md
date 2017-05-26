# OptionParser

## OptionParser is DRY

You only have to write the command-line switch, its arguments, the code to run
when it's encountered, and the command-line switch description once in your script.

OptionParser will automatically generate help screens for you from this description, as well as infer everything about the argument from its description.

## OptionParser automatically convert options to a specific class

If the option takes an integer, it can convert any string passed on the command-line to an integer. This cuts down on some of the tedium (boringness) involved in parsing command-line options.

## Everything is very contained

All of the options are in the same place, and the effect of the option is right along-side the definition for the option. If options have to be added, changed or someone simply wants to see what they do, there is only one place to look. Once the command-line is parsed, a single Hash or OpenStruct will hold the results.

## Use OptionParser in our code

In our code, we have the choice to enter three different units of temperature (Celsius, Kelvin, Fahrenheit) in the command-line. We can make use of the OptionParser to do this.

In our code, we also have a piece of code that will enter the output in a text file, also here we can make use of the OptionParser.

```rb
require 'optparse'

# this hash will hold all of the options
# parsed from the command-line by
# OptionParser
options = {}

optparse = OptionParser.new do |opts|
    # set a banner, displayed at the top
    # of the help screen
    opts.banner = "Usage: script.rb"

    # define the options, and what they do
    options[:celsius] = false
    opts.on('-c', '--celsius', 'Temperature in Celsius')
    do
        options[:celsius] = true
    end

    options[:kelvin] = false
    opts.on('-k', '--kelvin', 'Temperature in Kelvin')
    do
        options[:kelvin] = true
    end

    options[:fahrenheit] = false
    opts.on('-f', '--fahrenheit', 'Temperature in Fahrenheit')
    do
        options[:fahrenheit] = true
    end

    options[:logfile] = nil
    opts.on('-l', '--logfile FILE', 'Write output to FILE')
    do |file|
        options[:logfile] = file
    end

    # this displays the help screen, all programs are assumed
    # to have this option
    opts.on('-h', '--help', 'Display this screen')
    do
        puts opts
        exit
    end
end

optparse.parse!

puts "Temperature Celsius" if options[:celsius]
puts "Temperature Kelvin" if options[:kelvin]
puts "Temperature Fahrenheit" if options[:fahrenheit]
puts "Logging to file #{options[:logfile]}" if options[:logfile]

ARGV.each
do |f|
    puts "Hello world #{f}..."
    sleep 0.5
end
```
