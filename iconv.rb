# -*- coding: utf-8 -*-
require './conv'
require 'iconv'
1.upto(60000) do |i|
  nfc = [i].pack('U*')
  nfd = Conv.to_nfd(nfc)

  str = Iconv.conv('UTF-8', 'UTF8-MAC', nfd)

  if nfc != str
    puts "#{nfc} : #{nfc.bytes.inspect} : #{str.bytes.inspect}"
  end

end
