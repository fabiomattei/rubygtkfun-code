#!/usr/bin/env ruby

'''
This example demonstrates the Gtk::Application.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: June 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.warmingup", :flags_none)

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new(application)
  window.set_title("My first window")
  window.set_default_size(400, 400)
  window.show_all
end

puts app.run
