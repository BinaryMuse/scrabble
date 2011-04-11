require 'scrabble/tile'

module Scrabble
  class Bag
    TILE_QUANTITIES = {
      a: 9,
      b: 2,
      c: 2,
      d: 4,
      e: 12,
      f: 2,
      g: 3,
      h: 2,
      i: 9,
      j: 1,
      k: 1,
      l: 4,
      m: 2,
      n: 6,
      o: 8,
      p: 2,
      q: 1,
      r: 6,
      s: 4,
      t: 6,
      u: 4,
      v: 2,
      w: 2,
      x: 1,
      y: 2,
      z: 1,
      _: 2
    }

    def initialize
      @tiles = []
      TILE_QUANTITIES.each do |key, value|
        value.times do
          @tiles << Tile.new(key.to_s)
        end
      end
    end

    def empty?
      @tiles.empty?
    end

    def remaining
      @tiles.count
    end

    def remove(n = 1)
      raise "can't remove_random from an empty bag" if empty?
      raise "not enough tiles left"                 if n > remaining

      shuffle!
      @tiles.pop(n)
    end

    def replace(tiles)
      @tiles << tiles
      @tiles.flatten!
    end

    def shuffle!
      @tiles.shuffle!
    end
  end
end