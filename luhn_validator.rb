module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum(number)
    nums_a = number.to_s.chars.map(&:to_i)
    sum = 0
    parity = nums_a.length % 2
    nums_a.each_with_index |n,i| do 
      if i % 2 != parity
        sum = sum + n
      elsif n > 4
        sum = sum + 2 * n - 9
      else
        sum = sum + 2 * n
      end
    end
    return nums_a[-1] == ((10 - (sum % 10)) % 10 )
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
