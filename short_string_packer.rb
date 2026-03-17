# frozen_string_literal: true

# Packs/Unpacks a String to and from an Integer
module ShortStringPacker
  ## Packs a short string into a Integer
  # Arguments:
  #   str - String object
  # Returns: a Integer object
  def self.pack(str)
    str.split('')
       .map { |char| (char.ord - 96).to_s(2) }
       .reduce(0) { |acc, char| (acc << 5) + char.to_i(2) }
  end

  ## Unpacks a Integer from pack() method into a short string
  # Arguments:
  #   packed - a Integer object
  # Returns: a String object
  def self.unpack(packed)
    str = packed.to_s(2)
    target_length = (str.length + 4) / 5 * 5
    str.rjust(target_length, '0')
       .scan(/.{5}/)
       .map { |char| (char.to_i(2) + 96).chr }
       .join
    # if str.length > 5
    #   time = str.length + 5 - (str.length % 5)
    #   str = str.rjust(time, '0')
    # else
    #   str = str.rjust(6 - str.length, '0')
    # end
    # str.scan(/.{5}/).map { |char| (char.to_i(2) + 96).chr }.join('')
  end
end
