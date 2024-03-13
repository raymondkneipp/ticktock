import gleeunit
import gleeunit/should
import lib/event
import lib/time

pub fn main() {
  gleeunit.main()
}

pub fn event_create_test() {
  event.create(event.Event("Meeting 1", time.Time(12, 0), time.Time(13, 0)))
  |> should.be_ok()

  event.create(event.Event("Standup", time.Time(12, 0), time.Time(12, 15)))
  |> should.be_ok()

  event.create(event.Event("Bad Event", time.Time(12, 0), time.Time(12, 0)))
  |> should.be_error()

  event.create(event.Event("Meeting 3", time.Time(12, 0), time.Time(9, 0)))
  |> should.be_error()
}

pub fn event_duration_test() {
  event.Event("Workout A", time.Time(9, 0), time.Time(10, 0))
  |> event.duration
  |> should.equal(time.Time(1, 0))

  event.Event("Workout B", time.Time(0, 0), time.Time(23, 59))
  |> event.duration
  |> should.equal(time.Time(23, 59))

  event.Event("Workout C", time.Time(6, 15), time.Time(8, 45))
  |> event.duration
  |> should.equal(time.Time(2, 30))

  event.Event("Workout D", time.Time(6, 15), time.Time(6, 30))
  |> event.duration
  |> should.equal(time.Time(0, 15))
}
