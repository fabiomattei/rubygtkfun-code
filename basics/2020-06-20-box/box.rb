#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Box container.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: June 2020
'''

require 'gtk3'

class Application < Gtk::Application

  def initialize
    super 'org.rubygtkfun.box', Gio::ApplicationFlags::FLAGS_NONE

    signal_connect :activate do |application|
      window = Gtk::ApplicationWindow.new application
      window.set_default_size 300, 100
      window.set_title 'Example of a box container'

      box = Gtk::Box.new :horizontal # it could be :vertical too
      window.add box

      @hello_button = Gtk::Button.new :label => "Hello"
      box.add @hello_button

      @world_button = Gtk::Button.new :label => "World"
      box.add @world_button

      @label = Gtk::Label.new 'Still empty!'
      box.add @label

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
