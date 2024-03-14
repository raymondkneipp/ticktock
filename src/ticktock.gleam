import gleam/io
import gleam/list
import gleam/result
import lib/duration.{Duration}
import lib/time.{type Time, Time, add}
import lib/event.{Event}

pub fn main() {
  io.println("Hello from ticktock!")

  let events = [
    Event("Morning hygiene", duration.Duration(Time(6, 0), Time(6, 30))),
    Event("Strength Workout", duration.Duration(Time(6, 30), Time(7, 45))),
    Event("Breakfast (meal 1)", duration.Duration(Time(7, 45), Time(8, 45))),
    Event("Work", duration.Duration(Time(9, 0), Time(17, 0))),
  ]

  let valid_events =
    events
    |> list.try_map(event.new)
    |> result.unwrap([])

  let total_duration =
    valid_events
    |> list.map(fn(e) { e.duration })
    |> list.map(duration.length)
    |> list.fold(Time(0, 0), fn(b, a) { add(b, a) })

  io.debug(total_duration)
}
