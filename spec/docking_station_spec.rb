require 'docking_station'

describe DockingStation do

  describe '#release_bike' do
    it "should be empty by default" do
      expect {subject.release_bike}.to raise_error "No bikes available"
    end
  end

  it "have method dock with 1 argument" do
    expect(subject).to respond_to(:dock).with(1).argument
  end

  it "should return Bike class" do
    bikes = []
    bike = Bike.new
    expect(subject.dock(bike)).to eq bikes.push(bike)
    expect(subject.release_bike).to eq bikes.pop
  end

  describe '#dock' do
    it "cannot dock over capacity" do
      subject.capacity.times { subject.dock(Bike.new) }
      expect{subject.dock(Bike.new)}.to raise_error "It is full"
    end
  end

  it "has a default capacity" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it "responds to setting method" do
    expect(subject).to respond_to :capacity=
  end


  # it "should be able to set capacity" do
  #   random = 50
  #   set = DockingStation.new random
  #   expect(subject.capacity).to eq random
  # endst


end