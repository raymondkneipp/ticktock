import gleeunit
import gleeunit/should
import lib/event
import lib/time

pub fn main() {
  gleeunit.main()
}
// pub fn event_create_test() {
//   event.create(event.Event("Meeting 1", time.Time(12, 0), time.Time(13, 0)))
//   |> should.be_ok()

//   event.create(event.Event("Standup", time.Time(12, 0), time.Time(12, 15)))
//   |> should.be_ok()

//   event.create(event.Event("Bad Event", time.Time(12, 0), time.Time(12, 0)))
//   |> should.be_error()

//   event.create(event.Event("Meeting 3", time.Time(12, 0), time.Time(9, 0)))
//   |> should.be_error()
// }
