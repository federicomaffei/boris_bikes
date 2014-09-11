Boris-Bikes
====================

Boris Bikes is the Week 3 project I did at [Makers Academy](http://www.makersacademy.com).

The main aim of the project is creating a system for managing a bike rental system, similar to [Boris Bikes](https://en.wikipedia.org/wiki/Barclays_Cycle_Hire) in London, using the basics of [Object Oriented Programming](https://en.wikipedia.org/wiki/Object-oriented_programming).

The domain model, as presented to us, can be described as so:

> We are building a system that manages bikes that can be rented by users from docking stations and returned there at the end of the rental. 
> The bikes can break while being used, in which case they will not be available for rental after they are returned. 
> There is a garage that can fix broken bikes. 
> A van is used to move broken bikes from the stations to the garage. It can also be used to take fixed bikes back to the station(s). 
> The van, all stations and the garage have fixed capacity, so they cannot take more bikes that they can hold.

##The features I implemented via TDD are:

1. A *Bike* object, that can be initialized, stored in a *DockingStation*, and has a method that returns its state (broken or fixed).

2. The creation of a *DockingStation* object, that can dock and release *Bikes*, returning information about *Bikes* availability and state.

3. The creation of a *Van* object, that can take broken *Bikes* from a *DockingStation* and take them to the *Garage*, to be fixed.

4. The creation of a *Garage* object, that can fix broken bikes.

5. The [encapsulation](http://en.wikipedia.org/wiki/Encapsulation_\(object-oriented_programming\)) of the functionalities that were common to the DockingStation, Van and Garage objects, defining a BikeContainer module.

###The programming languages and technologies I used are:

* Ruby

* Rspec

###How to test the application:

* From command line enter:
```bash
git clone git@github.com:federicomaffei/boris_bikes.git
cd boris_bikes
rspec
```