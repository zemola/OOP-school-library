class Corrector
  attr_accessor :name

  def correct_name(name)
    name.length >= 10 ? name[0..9].capitalize : name.capitalize
  end
end
