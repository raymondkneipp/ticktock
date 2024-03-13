import gleam/int.{clamp}

pub type Time {
  Time(hour: Int, minute: Int)
}

pub fn create(hour: Int, minute: Int) -> Time {
  Time(clamp(hour, 0, 23), clamp(minute, 0, 59))
}

pub fn add(a: Time, b: Time) -> Time {
  let total_minutes = a.minute + b.minute
  let minute = total_minutes % 60
  let hour = a.hour + b.hour + total_minutes / 60
  Time(hour, minute)
}
