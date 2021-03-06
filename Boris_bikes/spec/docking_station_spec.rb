require './lib/docking_station.rb'

describe DockingStation do
  it "tests docking_station" do
    bike_double = double :bike
  end
  # type checking
  # it { should respond_to(:release_bike, :dock_empty?) }

  # initialize test
  # it { expect(subject.arr).to eq []}

  # dock_empty? test when it's a empty array
  #   it {
  #     subject.arr = []
  #     expect(subject.dock_empty?).to be true
  #     expect(subject.arr).to eq []
  #   }
  #
  # #dock_empty? test when it's not a empty array
  #   it {
  #     subject.arr = [1]
  #     expect(subject.dock_empty?).to be false
  #     expect(subject.arr).to eq [1]
  #   }

  # release_bike test
  it {
    subject.arr = []
    expect { subject.release_bike }.to raise_error('Sorry, no bike in the dock')
    expect(subject.arr).to eq []
  }

  # full? test when there are 20 bikes
  # it {
  #   subject.arr = (1..20).map { |i| Bike.new }
  #   expect(subject.full?).to be true
  #   expect(subject.arr).to all( be_instance_of (Bike) )
  #   expect(subject.arr.length).to be 20
  # }

  # dock test
  it {
    bike_double = double :bike
    DEFAULT_CAPACITY = 20
    subject.arr = (1..DEFAULT_CAPACITY).map { |_i| bike_double }
    expect { subject.dock(bike_double) }.to raise_error('Sorry, the capacity of the station was already filled')
    expect(subject.arr).to all(be bike_double)
    expect(subject.arr.length).to be DEFAULT_CAPACITY
  }

  it {
    bike_double = double :bike
    @capacity = 24
    docking_station = DockingStation.new(24)
    docking_station.arr = (1..24).map { |_i| bike_double }
    expect { docking_station.dock(bike_double) }.to raise_error('Sorry, the capacity of the station was already filled')
    expect(docking_station.arr).to all(be bike_double)
    expect(docking_station.arr.length).to be 24
  }

  it 'should return false if bike is broken' do
    bike_double = double :bike
    docking_station = DockingStation.new
    broken_bike = bike_double
    expect(docking_station.report(broken_bike)).to eq [broken_bike]
  end

  it 'should not release if bike is broken' do
    bike_double = double :bike
    docking_station = DockingStation.new
    broken_bike = bike_double
    docking_station.report(broken_bike)
    docking_station.dock(broken_bike)
    expect { docking_station.release_bike }.to raise_error('Cant release broken bike')
  end

  # it 'should release a bike if bike isnt broken' do
  #   docking_station = DockingStation.new
  #   broken_bike = Bike.new
  #   working_bike = Bike.new
  #   docking_station.dock(working_bike)
  #   docking_station.report(broken_bike)
  #   docking_station.dock(broken_bike)
  #   expect (docking)
  # end
  # it {
  #   docking_station = DockingStation.new
  #   broken_bike = Bike.new
  #   expect(docking_station.dock(broken_bike, broken)).to
  # }
  # type checking
  # it { should respond_to(:dock).with(1).argument }
end
