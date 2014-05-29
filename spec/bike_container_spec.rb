require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) {Bike.new}
	let(:holder) {ContainerHolder.new}	

	def fill_station(holder)
		holder.capacity=(20)
		20.times{holder.dock(Bike.new)}
	end

	it 'should accept a bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it 'should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	it 'should not release a bike if empty' do
		holder.dock(bike)
		holder.release(bike)
		expect{holder.release(bike)}.to raise_error(RuntimeError)
	end

	it 'should not release a bike with no arguments passed' do
		expect{holder.release()}.to raise_error(ArgumentError)
	end

	it 'should know when it is full' do
		fill_station(holder)
		expect(holder).to be_full
	end

	it "should not accept a bike when it's full" do
		fill_station(holder)
		expect{holder.dock(bike)}.to raise_error("The docking station is full")

	end

	it 'should provide the list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq [working_bike]
	end
end