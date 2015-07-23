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
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
    expect(subject.release_bike).to eq bike
    expect(subject.release_bike).to be_working
  end

end