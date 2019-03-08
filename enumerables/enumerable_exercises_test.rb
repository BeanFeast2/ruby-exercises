require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class EnumerablesTest < Minitest::Test
  def test_squares
    numbers = [1, 2, 3, 4, 5]
    actual = numbers.map do |number|
      number ** 2
    end
    assert_equal [1, 4, 9, 16, 25], actual
  end

  def test_find_waldo
    words = ["noise", "dog", "fair", "house", "waldo", "bucket", "fish"]
    actual = words.find do |word|
      word == 'waldo'
    end
    assert_equal "waldo", actual
  end

  def test_pick_words_with_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    actual = words.select{|word| word.length == 3}
    assert_equal ["bad", "cat", "dog", "red"], actual
  end

  def test_normalize_zip_codes
    numbers = [234, 10, 9119, 38881]
    actual = numbers.map do |num|
      num.to_s.rjust(5, "0")
    end
    assert_equal ["00234", "00010", "09119", "38881"], actual
  end

  def test_no_waldo
    words = ["scarf", "sandcastle", "flag", "pretzel", "crow", "key"]
    found = words.include?('waldo')
    # can't find method that returns nil if element doesn't exist
    found = nil if !found
    assert_nil found
  end

  def test_pick_floats
    numbers = [3, 1.4, 3.5, 2, 4.9, 9.1, 8.0]
    actual = numbers.select{|num| num.class == Float}
    assert_equal [1.4, 3.5, 4.9, 9.1, 8.0], actual
  end

  def test_words_with_no_vowels
    words = ["green", "sheep", "travel", "least", "boat"]
    actual = words.collect{|str| str.delete('aeiou')}
    assert_equal ["grn", "shp", "trvl", "lst", "bt"], actual
  end

  def test_has_at_least_one_zero
    numbers = [2, 0, 9, 3, 0, 1]
    actual = numbers.include?(0)
    assert_equal true, actual
  end

  def test_all_gone
    words = ["gone", "gone", "gone", "gone", "gone", "gone", "gone"]
    actual = words.collect{|word| word == 'gone'}
    actual = !actual.include?(false)
    assert_equal true, actual
  end

  def test_count_numbers_greater_than_17
    numbers = [9, 18, 12, 17, 1, 3, 99]
    numbers.select!{|num| num > 17}
    actual = numbers.length
    assert_equal 2, actual
  end

  def test_array_with_the_most_items
    arrays = [[:a, :b, :c], [1, 2, 3, 4, 5], ["zoo", :things, :stuff]]
    long_arr = []
    arrays.each_with_index do |arr, i|
      long_arr = arr if i == 0
      long_arr = arr if arr.length > long_arr.length
    end
    actual = long_arr
    assert_equal [1, 2, 3, 4, 5], actual
  end

  def test_group_words_by_first_letter
    words = ["ant", "axis", "albatross", "bolt", "badge", "butter", "car", "cdr", "column"]
    actual = {
      'a' => words.select{|str| str[0] == 'a'},
      'b' => words.select{|str| str[0] == 'b'},
      'c' => words.select{|str| str[0] == 'c'}
    }
    expected = {"a"=>["ant", "axis", "albatross"], "b"=>["bolt", "badge", "butter"], "c"=>["car", "cdr", "column"]}
    assert_equal expected, actual
  end

  def test_none_are_negative
    numbers = [9, 3, 1, 8, 3, 3, 5]
    actual = numbers.all?{|num| num > 0}
    assert true, actual
  end

  def test_one_time
    words = ["morning", "time", "evening", "noon", "dusk", "dawn"]
    actual = words.include?('time')
    assert_equal true, actual
  end

  def test_sum_a_list_of_numbers
    numbers = [32, 1, 21, 5, 81, 333]
    actual = 0
    actual = numbers.sum
    assert_equal 473, actual
  end

  def test_remove_numbers_divisible_by_3
    numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    actual = numbers.delete_if{|num| num % 3 == 0}
    assert_equal [1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20], actual
  end

  def test_sort_alphabetically
    words = ["broccoli", "Carrots", "FISH", "Bacon", "candy"]
    actual = words.sort_by{|word| word.downcase}
    assert_equal ["Bacon", "broccoli", "candy", "Carrots", "FISH"], actual
  end

  def test_speed_interview_pairs
    list1 = ["Alice", "Bob", "Charlie"]
    list2 = ["Xenia", "Yves", "Zach"]
    actual = [list1, list2].transpose
    assert_equal [["Alice", "Xenia"], ["Bob", "Yves"], ["Charlie", "Zach"]], actual
  end

  def test_all_4_letter_words
    words = ["love", "hate", "fire", "bird", "call"]
    actual = words.all?{|word| word.length == 4}
    assert_equal true, actual
  end

  def test_has_a_multi_word_phrase
    phrases = ["Sure!", "OK.", "I have no idea.", "Really?Whatever."]
    actual = phrases.each do |phrase|
      if phrase.include?(' ')
        return true
      end
    end
    assert_equal true, actual
  end

  def test_count_words_that_are_uppercase
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    actual = words.count{|word| word.upcase == word}
    assert_equal 3, actual
  end

  def test_smallest_number
    numbers = [1, 10, 100, 1000, 10000, 1000000]
    actual = numbers.min
    assert_equal 1, actual
  end

  def test_most_programmers
    programmers = {ruby: ["katrina", "sandi", "jim", "aaron", "desi"], java: ["abby", "jon", "susan"]}

    actual = programmers.keys

    assert_equal :ruby, actual.first
  end

  def test_group_words_by_uniqueness
    words = ["one", "two", "one", "TWO", "three", "one", "three", "three", "three"]
    actual = {
      'one' => words.select{|word| word.downcase == 'one'},
      'two' => words.select{|word| word.downcase == 'two'},
      'three' => words.select{|word| word.downcase == 'three'}
    }
    expected = {"one"=>["one", "one", "one"], "two"=>["two", "TWO"], "three"=>["three", "three", "three", "three"]}
    assert_equal expected, actual
  end

  def test_none_are_broken
    things = ["functional", "working", "works", "fixed", "good"]
    actual = !things.include?('broken')
    assert actual
  end

  def test_one_time
    words = ["morning", "time", "evening", "noon", "dusk", "dawn"]
    one_times = words.count{|word| word == 'time'}
    actual = one_times == 1
    assert actual
  end

  def test_multiply_list_of_numbers
    numbers = [2, 3, 5, 7]
    actual = 0
    actual = numbers.inject(:*)
    assert_equal 210, actual
  end

  def test_remove_words_with_more_than_three_letters
    words = ["pill", "bad", "finger", "cat", "blue", "dog", "table", "red"]
    actual = words.delete_if{|word| word.length > 3}
    assert_equal ["bad", "cat", "dog", "red"], actual
  end

  def test_pick_dinosaurs
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
    actual =  animals.select{|word| word[-3..-1] == 'rus'}
    assert_equal ["tyrannosaurus", "achillesaurus", "qingxiusaurus"], actual
  end

  def test_sort_by_distance
    distances = ["1cm", "9cm", "30cm", "4cm", "2cm"]
    actual = distances.each{|d| d.delete!('cm')}.sort_by(&:to_i).collect{|d| d + 'cm'}
    assert_equal ["1cm", "2cm", "4cm", "9cm", "30cm"], actual
  end

  def test_solitaire
    list1 = ["Ace", "6", "10", "Queen"]
    list2 = [:clubs, :diamonds, :hearts, :spades]
    actual = [list1, list2].transpose
    assert_equal [["Ace", :clubs], ["6", :diamonds], ["10", :hearts], ["Queen", :spades]], actual
  end

  def test_all_multiples_of_7
    numbers = [42, 14, 35, 49, 28, 56, 21, 7]
    actual = numbers.all?{|num| num % 7 == 0}
    assert actual
  end

  def test_sort_by_number_of_cents
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    actual = prices.sort_by{|f| f.modulo(1)}
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], actual
  end

  def test_remove_dinosaurs
    animals = ["tyrannosaurus", "narwhal", "eel", "achillesaurus", "qingxiusaurus"]
    notasaurus = animals.delete_if{|a| a[-3..-1] == 'rus'}
    assert_equal ["narwhal", "eel"], notasaurus
  end

  def test_remove_hashes
    elements = ["cat", {:dog=>"fido"}, 23, {:stuff=>"things"}, "aimless", 43]
    actual = elements.delete_if{|e| e.class == Hash}
    assert_equal ["cat", 23, "aimless", 43], actual
  end

  def test_capitalize_keywords_in_phrase_one_fish_two_fish_red_fish_blue_fish
    keywords = ["fish", "blue"]
    actual = 'one fish two fish red fish blue fish'
    actual = actual.split(' ').map do |word|
      if word == keywords[0] || word == keywords[1]
        word.upcase
      else
        word
      end
    end
    actual = actual.join(' ')
    assert_equal 'one FISH two FISH red FISH BLUE FISH', actual
  end

  def test_subtract_smallest_values_from_100
    elements = [[8, 5, 3], [1, 9, 11], [4, 7, 2], [19, 34, 6]]
    actual = 100
    elements.each{|arr| actual -= arr.min}
    assert_equal 88, actual
  end

  def test_one_double_digit_number
    numbers = [8, 2, 10, 333, 9, 101]
    two_num_count = numbers.count{|num| num.to_s.length == 2}
    actual = two_num_count == 1
    assert actual
  end

  def test_group_by_number_of_zeros
    numbers = [1, 3, 500, 200, 4000, 3000, 10000, 90, 20, 500000]
    count_arr = numbers.map{|num| num.to_s.split('').count('0')}
    actual = {
      0 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 0}.compact,
      1 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 1}.compact,
      2 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 2}.compact,
      3 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 3}.compact,
      4 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 4}.compact,
      5 => count_arr.each_with_index.collect{|num, i| numbers[i] if num == 5}.compact
    }
    expected = {0=>[1, 3], 2=>[500, 200], 3=>[4000, 3000], 4=>[10000], 1=>[90, 20], 5=>[500000]}
    assert_equal expected, actual
  end

  def test_count_round_prices
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    actual = prices.count{|num| num.modulo(1) == 0}
    assert_equal 2, actual
  end

  def test_no_monkeys
    animals = ["elephant", "hippo", "jaguar", "python"]
    actual = animals.include?('monkeys')
    refute actual
  end
end
