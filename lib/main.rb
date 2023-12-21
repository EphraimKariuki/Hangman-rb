dictionary = File.readlines('google-10000-english-no-swears.txt')

words = dictionary.select do |word|
    word.length > 5 && word.length <= 12
end    

word = words.sample

puts word

class Game
    def initialize(word)
        @word = word
        @guess = []
        @guessed_word = Array.new(@word.length)
    end
    def play
        puts "The word is #{@word.length} letters long"
        puts "Enter a letter:"
        letter = gets.chomp.to_s
        @guess.push(letter)
        check_letter_in_word(letter)
    end
    def check_letter_in_word(letter)
        if @word.include?(letter)
            @word.split("").each_with_index do |item, index|
                if item == letter
                    @guessed_word[index] = item
                else 
                    @guessed_word[index] = "_"
                end
            end    
        end
        puts @guessed_word.join("")
    end
end 

#Example usage:
game = Game.new(word)
game.play
