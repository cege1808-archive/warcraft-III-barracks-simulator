require_relative 'spec_helper'

# A Footman should be able to attack other units as well as receive damage
# Later on, other units such as the peasant will be incapable of attacking

describe Footman do

  before :each do
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should do deal 10 (AP) damage to the enemy unit" do
      enemy = Footman.new
      @footman.attack!(enemy)
    end
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      enemy = Footman.new
      @footman.damage(enemy)
      expect(@footman.health_points).to eq(50) # starts at 60
    end
  end

end
