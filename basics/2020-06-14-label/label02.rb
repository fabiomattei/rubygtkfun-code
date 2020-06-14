#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Label widget.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: June 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.warmingup", :flags_none)

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new application
  window.set_title "My first window with a label"
  window.set_default_size 400, 400

  label = Gtk::Label.new 'My brand new label'
  window.add label

  puts label.text
  label.text='Hello again'

  puts label.methods

  window.show_all
end

puts app.run
