require 'van'
require "docking_station"
require "bike"

describe Van do
	let(:van) {Van.new(:capacity=>20)}
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}
	let(:garage) {Garage.new}

	it 'sets a default capacity for a new van' do
		expect(van.capacity).to eq 20
	end

	it 'can retrieve a broken bike from station' do
		station.dock(bike.break!)
		van.takes_broken_bikes_from(station)
		expect(van.bike_count).to eq 1
	end

	it 'can retrieve two broken bikes from the station' do
		station.dock(Bike.new.break!)
		station.dock(Bike.new.break!)
		van.takes_broken_bikes_from(station)
		expect(van.bike_count).to eq 2
	end

	it 'can retrieve fixed bixes from the garage' do
		garage.dock(Bike.new)
		garage.dock(Bike.new)
		garage.dock(Bike.new.break!)
		van.checkout_fixed_bikes_from(garage)
		expect(van.bike_count).to eq 2
	end

end