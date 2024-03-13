pub type Time {
  Time(hour: Int, minute: Int)
}

pub fn clamp_hour(hour: Int) -> Int {
  case hour {
    hour if hour >= 23 -> 23
    hour if hour <= 0 -> 0
    _ -> hour
  }
}

pub fn clamp_minute(minute: Int) -> Int {
  case minute {
    minute if minute >= 59 -> 59
    minute if minute <= 0 -> 0
    _ -> minute
  }
}

pub fn create(hour: Int, minute: Int) -> Time {
  Time(clamp_hour(hour), clamp_minute(minute))
}

pub fn add(a: Time, b: Time) -> Time {
  let total_minutes = a.minute + b.minute
  let minute = total_minutes % 60
  let hour = a.hour + b.hour + total_minutes / 60
  Time(hour, minute)
}
