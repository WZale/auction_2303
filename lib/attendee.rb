class Attendee
  attr_reader :name,
              :budget

  def initialize (attendee_data)
    @name = attendee_data[:name]
    @budget = attendee_data[:budget].delete("$").to_i
  end
end