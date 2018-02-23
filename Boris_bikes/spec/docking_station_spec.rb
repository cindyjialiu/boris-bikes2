require './lib/docking_station.rb'

describe DockingStation do
  bike = Bike.new

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
    DEFAULT_CAPACITY = 20
    subject.arr = (1..DEFAULT_CAPACITY).map { |_i| Bike.new }
    expect { subject.dock(Bike.new) }.to raise_error('Sorry, the capacity of the station was already filled')
    expect(subject.arr).to all(be_instance_of Bike)
    expect(subject.arr.length).to be DEFAULT_CAPACITY
  }
  # type checking
  # it { should respond_to(:dock).with(1).argument }
end
