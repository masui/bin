#!/usr/bin/ruby

DIR = "#{ENV['HOME']}/Downloads"
datadir = "#{ENV['HOME']}/HelpLine/omnibox/data"
Dir.open(DIR){ |dir|
  dir.each { |f|
    if f =~ /helpfeel.*\.json/
      time = File.mtime("#{DIR}/#{f}").strftime("%Y%m%d%H%M%S")
      puts "cat '#{DIR}/#{f}' | jq . > #{datadir}/helpfeel-#{time}.json"
      system "cat '#{DIR}/#{f}' | jq . > #{datadir}/helpfeel-#{time}.json"
      puts "/bin/rm '#{DIR}/#{f}'"
      system "/bin/rm '#{DIR}/#{f}'"
    end
  }
}

