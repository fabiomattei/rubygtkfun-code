#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Button widget.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: June 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.button", :flags_none)

def on_btn_clicked sender, event
  puts "clicking: " + sender.label
end

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new application
  window.set_title "My first window with a button"
  window.set_default_size 400, 400

  button = Gtk::Button.new :label => "My new button"
  button.set_size_request 80, 30
  window.add button
        
  button.signal_connect "clicked" do |sender, event| 
    on_btn_clicked sender, event
  end

  window.show_all
end

puts app.run
