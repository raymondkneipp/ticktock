import gleam/io
import gleam/list
import gleam/result
import lib/time
import lib/event

pub fn main() {
  io.println("Hello from ticktock!")

  let events = [
    event.Event("Morning hygiene", time.Time(6, 0), time.Time(6, 30)),
    event.Event("Strength Workout", time.Time(6, 30), time.Time(7, 45)),
    event.Event("Breakfast (meal 1)", time.Time(7, 45), time.Time(8, 45)),
    event.Event("Work", time.Time(9, 0), time.Time(17, 0)),
  ]

  let valid_events =
    events
    |> list.try_map(event.create)
    |> result.unwrap([])

  io.debug(valid_events)

  let duration =
    valid_events
    |> list.map(event.duration)

  io.debug(duration)

  let duration_sum =
    duration
    |> list.fold(time.Time(0, 0), fn(b, a) { time.add(b, a) })

  io.debug(duration_sum)
}
