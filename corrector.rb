class Corrector
  attr_accessor :name

  def correct_name(name)
    if name.length >= 10
      name.capitalize[0..9]
    else
      name.capitalize
    end
  end
end
