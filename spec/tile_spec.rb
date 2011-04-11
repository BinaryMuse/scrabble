require 'scrabble/tile'

describe Scrabble::Tile do
  context "representing a letter" do
    before(:each) do
      @tile = Scrabble::Tile.new("a")
    end

    it "returns its letter in uppercase" do
      @tile.letter.should == "A"
    end

    it "does not allow its letter to be changed" do
      lambda {
        @tile.letter = "B"
      }.should raise_error /cannot change/
    end

    it "has a value" do
      @tile.should respond_to :value
    end

    it "has a non-zero value" do
      @tile.value.should_not == 0
    end

    it "is not blank" do
      @tile.should_not be_blank
    end
  end

  context "representing a blank" do
    before(:each) do
      @tile = Scrabble::Tile.new("_")
    end

    it "returns an underscore for its letter if a specific letter is not set" do
      @tile.letter.should == "_"
    end

    it "allows its letter to be set" do
      lambda {
        @tile.letter = "B"
      }.should_not raise_error
    end

    it "returns its letter in lowercase if a letter is set" do
      @tile.letter = "B"
      @tile.letter.should == "b"
    end

    it "has no value" do
      @tile.value.should == 0
    end
  end

  it "allows creating a blank explicitly" do
    tile = Scrabble::Tile.new("A", true)
    tile.should be_blank
  end
end
