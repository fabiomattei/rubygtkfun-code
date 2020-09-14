#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Entry widget.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: September 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.checkbutton", :flags_none)

def on_key_release sender, event
  puts sender.text
end

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new application
  window.set_title "My first window with a check button"
  window.set_default_size 400, 100

  cb = Gtk::CheckButton.new "My option"
  cb.set_active true
  cb.set_can_focus false
  cb.signal_connect("clicked") do |w|
    on_clicked w
  end

  window.add cb

  def on_clicked sender
    if sender.active?
      puts "my option was checked"
    else
      puts "my option was unchecked"
    end
  end

  window.show_all
end

puts app.run

