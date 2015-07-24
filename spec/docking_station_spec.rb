require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it "should be empty by default" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end

    it "should not release broken bike" do
      bike = double :bike, working?: false
      subject.dock bike
      expect {subject.release_bike}.to raise_error "Can't release broken bike"
    end
  end

  it "have method dock with 1 argument" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "release the bike you docked" do
    bike = double :bike, working?: true
    subject.dock bike
    expect(subject.release_bike).to be bike
  end

  describe '#dock' do
    it "cannot dock over capacity" do
      subject.capacity.times { subject.dock double(:bike) }
      expect{subject.dock double(:bike)}.to raise_error "It is full"
    end
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "responds to setting method" do
    expect(subject).to respond_to :capacity=
  end


  it "should be able to set capacity" do
    random = 50
    set = DockingStation.new random
    expect(set.capacity).to eq random
  end





end