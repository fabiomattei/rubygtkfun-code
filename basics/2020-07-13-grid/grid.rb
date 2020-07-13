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
    super 'org.rubygtkfun.grid', Gio::ApplicationFlags::FLAGS_NONE

    signal_connect :activate do |application|
      window = Gtk::ApplicationWindow.new application
      window.set_default_size 300, 100
      window.set_title 'Example of a grid container'

      grid = Gtk::Grid.new
      grid.set_property "row-homogeneous", true
      grid.set_property "column-homogeneous", true
      window.add grid

      @hello_button = Gtk::Button.new :label => "Hello"
      grid.attach @hello_button, 0, 0, 1, 1 # child, left, top, width, height

      @world_button = Gtk::Button.new :label => "World"
      grid.attach @world_button, 1, 0, 1, 1 # child, left, top, width, height

      @label = Gtk::Label.new 'Still empty!'
      grid.attach @label, 0, 1, 2, 1        # child, left, top, width, height

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
    @label.text= sender.label
    puts "clicking: " + sender.label
  end

end


app = Application.new

puts app.run
