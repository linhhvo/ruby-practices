class Code
    POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
    }

    attr_reader :pegs

    # ::valid_pegs?
    # should accept an array of chars as an arg
    # when all chars of the array are in ::POSSIBLE_PEGS
    # should return true
    # when a char of the array is not in ::POSSIBLE_PEGS
    # should return false

    def self.valid_pegs?(chars)
        chars.all? {|char| POSSIBLE_PEGS.has_key?(char.upcase)}
    end

    # #initialize
    # should accept an array of chars representing pegs as an arg
    # should call Code::valid_pegs?
    # when the array does not contain valid pegs
    #     should raise an error
    # when the array contains valid_pegs
    #     should set @pegs to an array of chars from the arg
    #     should convert lowercase chars of the arg to uppercase in @pegs
        
    def initialize(chars)
        if Code.valid_pegs?(chars)
            @pegs = chars.map(&:upcase)
        else
            raise "This is not valid pegs."
        end
    end

    # ::random
    # should accept a length (number) as an arg
    # should call Code::new with an array of the given length containing random pegs
    # should return a Code instance with a randomized pegs array of the given length

    def self.random(length)
        chars = Array.new(length, POSSIBLE_PEGS.keys.sample)
        Code.new(chars)
    end

    # ::from_string
    # should accept a string representing pegs as an arg
    # should call Code::new with an array of chars
    # should return a Code instance with pegs colors given by the chars of the string

    def self.from_string(pegs)
        Code.new(pegs.split(''))
    end

    # #[]
    # should accept an index as an arg
    # should return the element of @pegs at the given index

    def [](index)
        @pegs[index]
    end

    # #length
    # should return the length of @pegs
    
    def length
        @pegs.length
    end

    
end
