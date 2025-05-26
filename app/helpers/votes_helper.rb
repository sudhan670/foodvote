module VotesHelper
  def voting_open?
      now = Time.zone.now
      return false unless now.tuesday?
      start_time = now.change(hour: 9, min: 0)
      end_time = now.change(hour: 20, min: 0)
      now >= start_time && now <= end_time
  end
  def check(check)
    if check == "yes"
      "Veg"
    elsif check =="no"
      "Non-Veg"
    else
      "Absent"
    end
  end
  def checkid(employee_id)
    if employee_id >= 1 && employee_id <= 150
      employee_id
    else
      "Search for Registered Employee from 1 to 150"
    end
  end
end
