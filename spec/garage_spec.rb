require 'garage'

describe Garage do
	let(:garage) {Garage.new(:capacity=>200)}
	let(:van) {Van.new(:capacity=>20)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}

	it 'sets a default capacity for a new van' do
		expect(garage.capacity).to eq 200
	end

	it 'only accepts broken bikes' do
		van.dock(Bike.new.break!)
		van.dock(Bike.new)
		garage.accept_bike_from(van)
		expect(garage.bike_count).to eq 1
		expect(van.bike_count).to eq 1
	end

	it 'fixes the broken bikes it receives' do
		van.dock(Bike.new.break!)
		van.dock(Bike.new.break!)
		van.dock(Bike.new)
		garage.accept_bike_from(van)
		expect(garage.available_bikes.count).to eq 2
	end

end