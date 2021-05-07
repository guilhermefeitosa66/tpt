#!/usr/bin/env ruby

require "tty"
require "tty-markdown"
require "tty-screen"
require "tty-reader"
require "tty-tree"
require "tty-cursor"
require "tty-platform"
require "tty-box"
require "colorize"
require "json"
require_relative './catpix/lib/catpix.rb'

class TPT
    # Constants for configuration
    THEME = {
      em: :yellow,
      header: [:blue, :bold],
      hr: :magenta,
      link: [:yellow, :underline],
      list: :yellow,
      strong: [:yellow, :bold],
      table: :magenta,
      quote: :magenta,
      image: :bright_black,
      note: :magenta,
      comment: :bright_black
    }

    WIDTH_TEXT = 60

    BORDER = { type: :thick, top: false, bottom: false, left: false, right: false }

    def initialize(path, start_slider_number)
        @path = path

        if (self.load_file(path) == false)
            self.quit()
        end

        if (start_slider_number > @total_slides || start_slider_number < 1)
            @current_slide = 0
        else
            @current_slide = start_slider_number - 1
        end

        @cursor = TTY::Cursor
    end

    def show()
        print @cursor.hide()

        while (true)
            system "clear"

            self.render_title_bar()
            self.render_slide()
            self.render_footer_bar()

            self.slide_controls()
        end
    end

    def slide_controls()
        reader = TTY::Reader.new
        key = reader.read_char

        case key
        when "q"
          self.quit()
        when "n"
          self.next_slide()
        when "b"
            self.prev_slide()
        when "r"
            self.load_file(@path)
        else
            "just reload the current slide"
        end
    end
        # add margin left to the slid
    def next_slide()
        if @current_slide < @total_slides - 1
            @current_slide += 1
        end
    end

    def prev_slide()
        if @current_slide > 0
            @current_slide -= 1
        end
    end

    def render_slide()
        # max_width = TTY::Screen.width
        # max_height = TTY::Screen.height

        slide_content = TTY::Markdown.parse(@slides.at(@current_slide), theme: THEME, width: WIDTH_TEXT)

        slide_content = slide_content.lines.map do |line|
            if line.include?('-image=')
                params = line.gsub('“', '').gsub('”', '').split(',')
                path = params[0].sub('-image=', '').strip
                size = params[1].strip

                if(File.exist?(path))
                    "\n" + self.render_image(path, size) + "\n"
                else
                    line
                end
            else
                line
            end
        end

        puts slide_content.join().gsub("\n", "\n\t")

        # box = TTY::Box.frame(slide_content, width: 80, height: (max_height - 6), border: BORDER, left: 10)
        # puts box
    end

    def render_title_bar()
        if @config.nil? == false
            max_width = TTY::Screen.width
            # max_height = TTY::Screen.height
            box_header = TTY::Box.frame(@config["title"], width: max_width, padding: 1, align: :center, border: BORDER)
            print box_header.bold.light_white.on_blue
        end
    end

    def render_footer_bar()
        max_width = TTY::Screen.width
        max_height = TTY::Screen.height
        footer_width = (max_width * 0.5).to_i
        top_position_footer = (max_height - 3).to_i

        if @config.nil? == false
            print TTY::Box.frame("#{@config['author']}", padding: 1, align: :left, width: footer_width, top: top_position_footer, left: 0, border: BORDER)
        end

        print TTY::Box.frame("#{@current_slide + 1} / #{@total_slides}", padding: 1, align: :right, width: footer_width, top: top_position_footer, left: footer_width, border: BORDER)
    end

    def render_image(path="./images/tux.png", size="low")
        options = {
            :limit_x => 0,
            :limit_y => 0.3,
            :center_y => true,
            :center_x => true
        }

        img = Catpix::print_image(path, options)

        return img
    end

    def quit()
        print @cursor.show()
        system "clear"
        puts "App finished!"
        exit!
    end

    def load_file(path)
        begin
            file = File.read(path).split("--tpt-config")
        rescue => exception
            puts exception
            puts "Impossible to load file: #{path.bold}"
            puts "before open the file, check and the --tpt-config"
            return false
        end

        if (file.size == 1)
            @slides = file.at(0).split("--new-slide")
            @config = nil
        elsif (file.size == 2)
            begin
                @config = JSON.parse(file.at(0))
            rescue => exception
                puts "error in json configuration format"
                return false
            end

            @slides = file.at(1).split("--new-slide")

            # @slides.each do |slide|
            #     # slide.lines.map! { |line| "\t" + line }.join("\n")
            #     slide.gsub!("\n", "\n\t")
            # end

            @total_slides = @slides.size

            return true
        else
            return false
        end
    end
end

if ARGV.length < 1
    puts "expecting 1 or 2 arguments".bold
    puts "run: ./tpt.rb <path/to/file.md> or"
    puts "run: ./tpt.rb <path/to/file.md> <start_slider_number>"
    puts ""
    puts "examples:".bold
    puts "$ ./tpt.rb slide.md"
    puts "$ ./tpt.rb slide.md 5"

    exit!
else
    path_to_slide_file = ARGV[0]
    start_slider_number = ARGV[1].to_i

    slide = TPT.new(path_to_slide_file, start_slider_number)
    slide.show()
end
