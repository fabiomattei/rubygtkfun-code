#!/usr/bin/env ruby

'''
This example demonstrates the Gtk::Grid container.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: July 2020
'''

require 'gtk3'

class Application < Gtk::Application

  def initialize
    super 'org.rubygtkfun.fixed', Gio::ApplicationFlags::FLAGS_NONE
	
    signal_connect :activate do |application|
      window = Gtk::ApplicationWindow.new application
      window.set_default_size 300, 150
      window.set_title 'Example of a grid container'

      @fixed = Gtk::Fixed.new
      window.add @fixed

      @hello_button = Gtk::Button.new :label => "Hello"
      @fixed.put @hello_button, 0, 0   # x, y

      @world_button = Gtk::Button.new :label => "World"
      @fixed.put @world_button, 100, 0 # x, y

      @label = Gtk::Label.new 'Still empty!'
      @fixed.put @label, 100, 100      # x, y

      @hello_button.signal_connect "clicked" do |sender, event| 
        on_btn_clicked sender, event
      end

      @world_button.signal_connect "clicked" do |sender, event| 
        on_btn_clicked sender, event
      end

      window.show_all
    end

  end

  def on_btn_clicked sender, event
    @fixed.move @label, 200, 100
    @label.text= sender.label
    puts "clicking: " + sender.label
  end

end


app = Application.new

puts app.run
