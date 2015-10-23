class Car
  attr_accessor :name, :dirty

  def initialize(name)
    @name = name
    @dirty = false
  end

  def run
    @dirty = true
    p "Car #{@name} is running"
  end
end

class Garage
  SIZE = 2

  def initialize
    (1..SIZE).each { |i| cars << Car.new(i) }
  end

  def cars
    @cars ||= []
  end

  def rent_cars
    @rent_cars ||= []
  end

  def rent
    if cars.length > 0
      car = cars.first
      cars.delete(car)
      rent_cars << car

      car
    else
      p "No car"
    end
  end

  def return(car)
    clean(car)
    rent_cars.delete(car)
    cars << car
  end

  def clean(car)
    car.dirty = false
  end
end

garage = Garage.new

car1 = garage.rent
car1.run

car2 = garage.rent
car2.run

_ = garage.rent # No cars

garage.return(car2)

car3 = garage.rent
car3.run
