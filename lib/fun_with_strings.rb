module FunWithStrings
  # Check if a string is a palindrome. Returns true or false
  def palindrome?
    # Ignore case
    forward = self.downcase
    # Ignore non alphabetic characters
    forward = forward.gsub(/[^a-z]/, '')
    # Reverse string
    backward = forward.reverse
    # Check if it's a palindrome (return is implied)
    backward == forward
  end
  # Counts words. Returns a hash.
  def count_words
    # Should return a hash
    count = Hash.new(0)
    # Split string
    words = self.downcase.gsub(/[^a-z]/, ' ').split(' ')
    # Loop through words
    words.each do |word|
      # Add 1 to count
      count[word] += 1
    end
    return count
  end
  def anagram_groups
    # Create an array for the results
    results = Array.new
    # Create a hash to count words
    counts = Hash.new(0)
    # Split string
    words = self.split(' ')
    words.each do |word|
      # Create an array of sorted chars ignoring case
      scramble = word.downcase.chars.sort
      # Add a word to scramble in the hash
      counts[scramble] += 1
    end
    if self == ''
      counts = []
    else
      counts
    end
  end
end

class String
  include FunWithStrings
end

class Main
  puts "dog god".anagram_groups
end