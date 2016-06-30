require_relative 'spec_helper'

#Unit should have a status if they are dead or not
#The dead cant attack and the alive cant attack the dead

describe Unit do 
  before :each do
    @unit = Unit.new(30,2)
  end

  describe "#is_dead?" do
    it "confirm if the unit is dead" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.is_dead?).to be true
    end

    it "confirm if the unit is not dead" do
      expect(@unit).to receive(:health_points).at_least(:once).and_return(5)
      expect(@unit.is_dead?).to be false
    end
  end

  describe "#attack!" do
    it "a dead unit cannot attack the living" do
      another_unit = Unit.new(40, 5)
      expect(@unit).to receive(:health_points).at_least(:once).and_return(0)
      
      expect(@unit.attack!(another_unit)).to be false
    end

    it "a dead unit cannot attack the dead" do
      another_unit = Unit.new(0, 5)
      expect(@unit).to receive(:health_points).at_least(:once).and_return(0)
  
      expect(@unit.attack!(another_unit)).to be false
    end

    it "a living unit cannot attack the dead" do
      another_unit = Unit.new(0, 5)

      expect(@unit.attack!(another_unit)).to be false
    end
  end


end
