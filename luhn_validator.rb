# frozen_string_literal: true

# LuhnValidator module provides a method to validate a credit card number
# using the Luhn algorithm.
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum # rubocop:disable Metrics/AbcSize
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    parity = nums_a.length % 2
    nums_a[0...-1].each_with_index do |n, i|
      sum += if i % 2 == parity
               doubled = n * 2
               doubled > 9 ? (doubled - 9) : doubled
             else
               n
             end
    end
    nums_a[-1] == ((10 - (sum % 10)) % 10)
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
