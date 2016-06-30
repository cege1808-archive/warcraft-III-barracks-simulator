require_relative 'spec_helper'


#Barracks have initial HP:500
describe Barracks do 
  before :each do
    @barracks = Barracks.new
  end

  it "has to have an initial HP of 500" do
    expect(@barracks.health_points).to eq(500)
  end

#Footman only does half of its AP against the Barracks
  it "only takes takes 1/2 the enemy's AP if the enemy is a Footman" do
    footman = Footman.new
    footman.attack!(@barracks)
    expect(@barracks.health_points).to eq(495)
  end

end