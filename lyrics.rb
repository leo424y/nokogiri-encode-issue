#!/usr/bin/ruby -w

# https://ruby-china.org/topics/6970 encoding
require 'nokogiri'

%x(rm -rf lyrics)
%x(mkdir lyrics)

file_paths = []
file_paths = %x(ls).split(' ').select{|x| x.match(/-/)}

file_paths.each_with_index do |file_path, index|
  html_doc = Nokogiri::HTML(File.open(file_path), nil, nil)

  result = html_doc.xpath('//*[@id="content_all"]').text

  File.write("./lyrics/#{file_path.gsub('.html', '.txt')}",result)
end
