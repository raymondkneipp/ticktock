import lib/time

pub type Event {
  Event(label: String, start: time.Time, end: time.Time)
}

pub fn create(event: Event) -> Result(Event, Nil) {
  case #(event.start, event.end) {
    #(start, end) if end.hour > start.hour ->
      Ok(Event(
        event.label,
        time.create(start.hour, start.minute),
        time.create(end.hour, end.minute),
      ))
    #(start, end) if end.hour == start.hour && end.minute > start.minute ->
      Ok(Event(
        event.label,
        time.create(start.hour, start.minute),
        time.create(end.hour, end.minute),
      ))
    _ -> Error(Nil)
  }
}

pub fn duration(event: Event) -> time.Time {
  let #(a, b) = #(event.start, event.end)
  time.Time(b.hour - a.hour, b.minute - a.minute)
}
