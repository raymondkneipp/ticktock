import lib/duration.{type Duration}
import lib/time

pub type Event {
  Event(label: String, duration: Duration)
}

pub fn new(event: Event) -> Result(Event, Nil) {
  let #(start, end) = #(event.duration.start, event.duration.end)

  let start = time.create(start.hour, start.minute)
  let end = time.create(end.hour, end.minute)

  let dur = duration.new(start, end)

  case dur {
    Ok(dur) -> Ok(Event(event.label, dur))
    _ -> Error(Nil)
  }
}
