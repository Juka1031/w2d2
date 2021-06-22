class GuessingGame
    attr_reader :num_attempts
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end

    def game_over?
        @game_over
    end

    def check_num(n)
        @num_attempts += 1
        @game_over = true if n == @secret_num
        p "you win" if n == @secret_num
        p "too big" if n > @secret_num
        p "too small" if n < @secret_num

    end

    def ask_user
        p "enter a number"
        check_num(gets.chomp.to_i)
    end


end
