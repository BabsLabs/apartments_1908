class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(apartment)
    @units << apartment
  end

  def average_rent
    # to make dynameic we iteratie through the @units and put their rent in an array and then average that array.
    rent_array = []
    @units.each do |unit|
      rent_array << unit.monthly_rent.to_f
    end
    (rent_array.sum)/rent_array.count
  end

  def renter_with_highest_rent
    @units.each do |unit|
      rented_apartments = []
      if unit.renter != nil
        rented_apartments << unit
        rented_apartments.max_by do |apartment|
          apartment.monthly_rent
          return apartment.renter
        end
      end
    end
  end


  def annual_breakdown
    breakdown_hash = {}
    @units.each do |unit|
      rented_apartments_array = []
      if unit.renter != nil
        rented_apartments_array << unit
        rented_apartments_array.each do |apartment|
        breakdown_hash[apartment.renter.name] = (apartment.monthly_rent * 12)
        end
      end
    end
    return breakdown_hash
  end


end
