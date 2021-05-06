#!/usr/bin/env ruby
# encoding: utf-8

# this is not a proper test, like unit test, integration test, etc...
# just a scratch of ideias to my app ;-)

require "tty-markdown"
require "tty-screen"
require "tty-reader"
require "tty-tree"
require "tty-cursor"
require "tty-platform"
require "tty-box"
require "colorize"
require "json"

# system "clear"
#
# reader = TTY::Reader.new
# cursor = TTY::Cursor
#
# platform = TTY::Platform.new
# # puts platform.linux?
#
# print cursor.hide
#
# max_width = TTY::Screen.width
# max_height = TTY::Screen.height
#
# box_header = TTY::Box.frame("Título da apresentação aqui", width: max_width, padding: 0, align: :center, border: :thick)
#
# string_footer = "Guilherme Feitoza - guilhermefeitosa66@gmail.com"
# box_footer = TTY::Box.frame(string_footer, width: max_width, align: :center, border: {type: :thick, top: false, bottom: false, left: false, right: false })
#
# print box_header.bold.light_white.on_blue
#
# print box_footer.bold.light_white.on_blue
#
# footer_width = (max_width / 2).to_i
# top_position_footer = (max_height - 3).to_i

# puts footer_width
#
# print TTY::Box.frame("Guilherme Feitoza", top: top_position_footer, left: 0, align: :left, border: {type: :thick, top: false, bottom: false, left: false, right: false }).yellow
# print TTY::Box.frame("Guilherme Feitoza", top: top_position_footer, left: footer_width, align: :right, border: {type: :thick, top: false, bottom: false, left: false, right: false }).yellow
# puts String.color_samples


# returns the screen size
# p TTY::Screen.size

# loop do
#   # system "clear"
#
#   key = reader.read_char
#   break if key == "q"
# end
#
# print cursor.show
# puts "Presentation finished!"

# test 01
# parsed = TTY::Markdown.parse_file('example.md')
# puts parsed

# test 02
# load string lines from file
# lines = []
# File.foreach("./example.md") { |line| lines << line }
# puts lines.size

# test 03
# File.foreach("./example.md") { |line|  puts TTY::Markdown.parse(line) }

# test 04
# json_config = File.read("./example.md").split("--tpt-config").first
# config = JSON.parse(json_config)
# p config
# puts config["title"]

# slides = File.read("./example.md").split("--new-slide")
# puts slides.class
# puts slides.first.class
# slides.each do |slide|
#   puts TTY::Markdown.parse(slide)
# end

# test 05
theme = {
  em: :yellow,
  header: [:magenta, :bold],
  hr: :yellow,
  link: [:yellow, :underline],
  list: :yellow,
  strong: [:yellow, :bold],
  table: :yellow,
  quote: :yellow,
  image: :bright_black,
  note: :yellow,
  comment: :bright_black
}

# puts TTY::Markdown.parse("# HEADING 01", theme: theme)
# puts TTY::Markdown.parse("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", width: 80)

# render tree with: --tree=path
# tree = TTY::Tree.new("../")
# tree = TTY::Tree.new("/home/guilherme/workspace/rails/choqueonline/app/views/")
# puts tree.render

# add some margin_left
string =
<<-eos
Lorem ipsum dolor sit amet, consectetur adipisicing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna
aliqua. Ut enim ad minim veniam, quis nostrud exercitation
ullamco laboris nisi ut aliquip ex ea commodo consequat.
Duis aute irure dolor in reprehenderit in voluptate velit
esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
occaecat cupidatat non proident, sunt in culpa qui officia
deserunt mollit anim id est laborum.
eos

string = string.lines.map { |line| "\t" + line }

puts string
