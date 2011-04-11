require 'scrabble/bag'

describe Scrabble::Bag do
  before(:each) do
    @bag = Scrabble::Bag.new
  end

  context "initially" do
    it "contains 100 tiles" do
      @bag.remaining.should == 100
    end

    it "isn't empty" do
      @bag.should_not be_empty
    end
  end

  context "removing one tile" do
    before(:each) do
      @tile = @bag.remove
    end

    it "only reduces the tiles by one" do
      @bag.remaining.should == 99
    end

    it "returns one item" do
      @tile.count.should == 1
    end

    it "return tiles" do
      @tile.first.should be_a Scrabble::Tile
    end
  end

  context "removing multiple tiles" do
    before(:each) do
      @count = 5
      @tiles = @bag.remove(@count)
    end

    it "reduces the tiles by the given amount" do
      @bag.remaining.should == 100 - @count
    end

    it "returns the given amount of tiles" do
      @tiles.count.should == @count
    end

    it "returns tiles" do
      @tiles.each { |t| t.should be_a Scrabble::Tile }
    end
  end

  context "shuffling" do
    it "shuffles the bag" do
      new_tiles = (1..1000).to_a
      @bag.instance_variable_set(:@tiles, new_tiles.clone)
      @bag.shuffle!
      @bag.instance_variable_get(:@tiles).should_not == new_tiles
    end
  end

  context "when empty" do
    before(:each) do
      @bag.instance_variable_set(:@tiles, [])
    end

    it "raises an error when trying to remove tiles" do
      lambda {
        @bag.remove
      }.should raise_error /empty/
    end
  end

  context "when low on tiles" do
    before(:each) do
      @bag.instance_variable_set(:@tiles, [Scrabble::Tile.new("A")])
    end

    it "raises an error when trying to remove too many tiles" do
      lambda {
        @bag.remove(2)
      }.should raise_error /not enough/
    end
  end

  context "#replace" do
    before(:each) do
      @tile  = Scrabble::Tile.new("A")
      @tiles = [Scrabble::Tile.new("A"), Scrabble::Tile.new("B")]
      @bag.instance_variable_set(:@tiles, [])
    end

    it "places a tile back into the bag" do
      @bag.replace(@tile)
      @bag.remaining.should == 1
    end

    it "places multiple tiles back into the bag" do
      @bag.replace(@tiles)
      @bag.remaining.should == 2
    end
  end
end
