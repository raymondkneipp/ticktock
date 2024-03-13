import gleeunit
import gleeunit/should
import lib/time

pub fn main() {
  gleeunit.main()
}

pub fn clamp_hour_test() {
  time.clamp_hour(-5)
  |> should.equal(0)

  time.clamp_hour(0)
  |> should.equal(0)

  time.clamp_hour(12)
  |> should.equal(12)

  time.clamp_hour(23)
  |> should.equal(23)

  time.clamp_hour(36)
  |> should.equal(23)
}

pub fn clamp_minute_test() {
  time.clamp_minute(-5)
  |> should.equal(0)

  time.clamp_minute(0)
  |> should.equal(0)

  time.clamp_minute(12)
  |> should.equal(12)

  time.clamp_minute(59)
  |> should.equal(59)

  time.clamp_minute(60)
  |> should.equal(59)
}

pub fn time_create_test() {
  time.create(55, 555)
  |> should.equal(time.Time(23, 59))

  time.create(55, 555)
  |> should.not_equal(time.Time(55, 555))
}

pub fn time_add_test() {
  time.add(time.Time(3, 30), time.Time(5, 45))
  |> should.equal(time.Time(9, 15))
}
