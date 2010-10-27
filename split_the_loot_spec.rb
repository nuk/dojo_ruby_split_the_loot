require "split_the_loot"

describe "SplitTheLoot" do

	it "should return an empty treasure for a single pirate" do
		treasure = []
		number_of_pirates = 1
		splitter = SplitTheLoot.new
		splitter.split(treasure,number_of_pirates).should == [[]]
	end

end
