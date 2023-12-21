dictionary = File.readlines('google-10000-english-no-swears.txt')

words = dictionary.select do |word|
    word.length > 5 && word.length <= 12
end    

untidy_word = words.sample 
word = untidy_word[0..untidy_word.length-2]


class Game
    def initialize(word)
        @word = word
        @guess = []
        @guessed_word = Array.new(@word.length, "_")
        @max_guesses = @word.length * 3
        game_over = false
    end
    def play
        puts "The word is #{@word.length} letters long"
        puts "Enter a letter:"
        p @word
        letter = gets.chomp.to_s
        @guess.push(letter)
        check_game_over
        check_letter_in_word(letter)
        
    end
    def check_letter_in_word(letter)
          
        if @game_over
            puts "The correct word is : #{@word}"
        else 
            if @word.include?(letter)
                @word.split("").each_with_index do |item, index|
                    if item == letter
                        @guessed_word[index] = item
                    end
                end 
                puts "Your guess is correct. Hint: #{@guessed_word.join("")}"  
            else 
                puts "Your guess is wrong. Hint: #{@guessed_word.join("")}"
            end

            check_game_over
            
            if @game_over
                puts "Thats the correct word. You've Won!"
            else
                play
            end        
        end      
    end

    def check_game_over
        if @guess.length == @max_guesses
            
            puts "You've reached your maximum number of guesses"
            puts "Game over"
            @game_over = true
        elsif @guessed_word.join("") == @word
            puts "You guessed the correct word"
            puts "Game over"
            @game_over = true
        else
            @game_over = false
        end
    end
end 

#Example usage:
game = Game.new(word)
game.play
