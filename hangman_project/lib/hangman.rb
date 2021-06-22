class Hangman
    DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
    attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
    def self.random_word
      DICTIONARY.sample
    end

  def initialize

      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, '_')
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
      @attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
      index = []
      @secret_word.each_char.with_index {|char1,idx| index<<idx if char1 == char}
      index
  end

  def fill_indices (char,arr)
      arr.each {|idx| @guess_word[idx] = char}
  end

  def try_guess(char)
    
      if already_attempted?(char) == true
          p "that has already been attempted"
          return false
      else
          @attempted_chars << char
          if get_matching_indices(char) != [] #means guess was correct and a array of index is returned
            fill_indices(char,get_matching_indices(char))
          else
            @remaining_incorrect_guesses -= 1
          end
          return true
      end
  end

  def ask_user_for_guess
      p "Enter a char:"
      guess = gets.chomp
      try_guess(guess)

  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN" 
      return true
    else
       false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      false
    end

  end

  def game_over?

    if self.win? == true || self.lose? == true
      p @secret_word
      return true
    else
      false
    end
  end

end

