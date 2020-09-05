#!/usr/bin/ruby

'''
This example demonstrates the Gtk::Entry widget.

Author: Fabio Mattei
Website: https://fabiomattei.github.io/rubygtkfun
Last modified: September 2020
'''


require 'gtk3'

app = Gtk::Application.new("org.rubygtkfun.combobox", :flags_none)

def on_key_release sender, event
  puts sender.text
end

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new application
  window.set_title "My first window with a combo box"
  window.set_default_size 400, 100

  cb = Gtk::ComboBoxText.new
  cb.signal_connect "changed" do |w, e|
    on_changed w, e
  end

  cb.append_text 'Linux'
  cb.append_text 'Windows'
  cb.append_text 'Mac Os'

  window.add cb

  def on_changed sender, event
    puts sender.active_text
  end

  window.show_all
end

puts app.run

