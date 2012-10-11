#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)

require "daemons"
require "keep_alive"

%x[say -v "Cellos" "internet gitti hagi restart ediyom hah."]

Daemons.run "keep_alive.rb"
# Process.daemon
