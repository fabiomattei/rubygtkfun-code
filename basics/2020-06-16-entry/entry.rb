#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Entry widget.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: June 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.entry", :flags_none)

def on_key_release sender, event
  puts sender.text
end

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new application
  window.set_title "My first window with a label"
  window.set_default_size 400, 400

  entry = Gtk::Entry.new
  window.add entry

  entry.signal_connect "key-release-event" do |w, e|
    on_key_release w, e
  end

  window.show_all
end

puts app.run
