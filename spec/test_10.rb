require_relative 'spec_helper'

# All units can attack and receive damage, so that logic should actually be on the Unit class, not the Peasant class
# This way, you don't have to add damage and attack methods on all types of units

# After making the tests pass, consider what modifications you can make to the Peasant and Footman classes to take advantage of this inheritence

describe Unit do

  before :each do
    @unit = Unit.new(100, 3)
  end

  describe "#damage" do
    it "should reduce the unit's health_points by the attack_power specified" do
      @unit.damage(@unit)
      expect(@unit.health_points).to eq(97) 
    end
  end

  describe "#attack!" do
    it "should deal the appropriate (attack power based) damage to the enemy unit" do
      meow = Unit.new(40, 55)
      meow.attack!(@unit)
      expect(@unit.health_points).to eq(45)
    end
  end

end
