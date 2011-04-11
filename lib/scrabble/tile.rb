module Scrabble
  class Tile
    LETTER_VALUES = {
      a: 1,
      b: 3,
      c: 3,
      d: 2,
      e: 1,
      f: 4,
      g: 2,
      h: 4,
      i: 1,
      j: 8,
      k: 5,
      l: 1,
      m: 3,
      n: 1,
      o: 1,
      p: 3,
      q: 10,
      r: 1,
      s: 1,
      t: 1,
      u: 1,
      v: 4,
      w: 4,
      x: 8,
      y: 4,
      z: 10
    }

    def initialize(letter, blank = false)
      @letter = letter
      @blank  = blank
      @blank  = true if letter == "_"
      @value  = LETTER_VALUES[letter.downcase.to_sym]
    end

    def letter
      blank? ? @letter.downcase : @letter.upcase
    end

    def letter=(letter)
      raise "cannot change the letter of a tile" unless blank?
      @letter = letter
    end

    def blank?
      @blank
    end

    def value
      blank? ? 0 : @value
    end

    def to_s
      blank? ? @letter.downcase : @letter.upcase
    end
  end
end
