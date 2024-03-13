import gleeunit
import gleeunit/should
import lib/time

pub fn main() {
  gleeunit.main()
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
