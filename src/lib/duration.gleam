import lib/time.{type Time, Time}

pub type Duration {
  Duration(start: Time, end: Time)
}

pub fn new(start: Time, end: Time) -> Result(Duration, Nil) {
  let start = time.create(start.hour, start.minute)
  let end = time.create(end.hour, end.minute)

  case #(start, end) {
    #(start, end) if end.hour > start.hour -> Ok(Duration(start, end))
    #(start, end) if end.hour == start.hour && end.minute > start.minute ->
      Ok(Duration(start, end))
    _ -> Error(Nil)
  }
}

pub fn length(duration: Duration) -> Time {
  let #(a, b) = #(duration.start, duration.end)
  Time(b.hour - a.hour, b.minute - a.minute)
}
