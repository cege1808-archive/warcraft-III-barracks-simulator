require_relative 'spec_helper'

# A SiegeEngine requires lumber when build by Barrack

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

  it "has initial 500 lumber" do
    expect(@barracks.lumber).to eql(500)
  end

  describe "#can_create_SiegeEngine?" do
    it "returns true if there is enough resources to create SiegeEngine" do
      expect(@barracks.can_create_SiegeEngine?).to be_truthy

    end

    it "retruns false if there isnt enough gold" do
      expect(@barracks).to receive(:gold).and_return(198)
      expect(@barracks.can_create_SiegeEngine?).to be_falsey
    end

    it "retruns false if there isnt enough food" do
      expect(@barracks).to receive(:food).and_return(1)
      expect(@barracks.can_create_SiegeEngine?).to be_falsey
    end

    it "retruns false if there isnt enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(55)
      expect(@barracks.can_create_SiegeEngine?).to be_falsey
    end

  end

  describe "#damage" do
    it "takes 2 times the enemy's AP if the enemy is a SiegeEngine" do
      siege = SiegeEngine.new
      # @barracks.damage(siege)
      siege.attack!(@barracks)
      expect(@barracks.health_points).to eq(400)
    end
  end

end

describe SiegeEngine do

  before :each do
    @siegeengine = SiegeEngine.new
  end

  it "has initial health points of 400" do
    expect(@siegeengine.health_points).to eq(400)
  end

  it "has attack points of 50" do
    expect(@siegeengine.attack_power).to eq(50)
  end

  describe "#can_attack?" do
    it "SiegeEngine can attack Barracks" do
      barracks = Barracks.new
      # @siegeengine.attack!(barracks)
      expect(@siegeengine.attack!(barracks)).to be true
      expect(barracks.health_points).to eq(400)
    end

    it "SiegeEngine can attack other SiegeEngine" do
      siege = SiegeEngine.new
      # expect(@siegeengine.attack!(siege)).to be true
      # binding.pry
      @siegeengine.attack!(siege)
      expect(siege.health_points).to eql(350)
    end

    it "SiegeEngine cant attack Footman" do
      footman = Footman.new
      expect(@siegeengine.attack!(footman)).to be false
      expect(footman.health_points).to eql(60)
    end

    it "SiegeEngine cant attack Peasant" do
      peasant = Peasant.new
      expect(@siegeengine.attack!(peasant)).to be false
      expect(peasant.health_points).to eql(35)
    end

  end


end
