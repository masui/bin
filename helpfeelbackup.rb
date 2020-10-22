#!/usr/bin/ruby

DIR = "/Users/masui/Downloads"
Dir.open(DIR){ |dir|
  dir.each { |f|
    if f =~ /helpfeel.*\.json/
      time = File.mtime("#{DIR}/#{f}").strftime("%Y%m%d%H%M%S")
      puts "cat '#{DIR}/#{f}' | jq . > /Users/masui/HelpLine/omnibox/data/helpfeel-#{time}.json"
      system "cat '#{DIR}/#{f}' | jq . > /Users/masui/HelpLine/omnibox/data/helpfeel-#{time}.json"
      puts "/bin/rm '#{DIR}/#{f}'"
      system "/bin/rm '#{DIR}/#{f}'"
    end
  }
}

