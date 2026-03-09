# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    list = str.split('')
    .map {|char| (char.ord-96).to_s(2)}
    .reduce(0){|acc, char| (acc << 5) + char.to_i(2)  }
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    str = packed.to_s(2)
    if str.length > 5
      time = str.length + 5 - (str.length % 5)
      str = str.rjust(time, '0')
    else
      str = str.rjust(6-str.length, '0')
    end
    str.scan(/.{5}/).map {|char| (char.to_i(2)+96).chr}.join('')
    

  end
end
