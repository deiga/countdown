ms_to_days_hours_minutes_seconds = (time_in_ms) ->
  second = 1000
  minute = 60 * second
  hour = 60 * minute
  day = 24 * hour
  days = Math.floor( time_in_ms / day )
  time_wo_days = time_in_ms - days * day
  hours = Math.floor ( time_wo_days / hour )
  time_wo_hours = time_wo_days - hours * hour
  minutes = Math.floor ( time_wo_hours / minute )
  time_wo_minutes = time_wo_hours - minutes * minute
  seconds = Math.floor (time_wo_minutes / second)
  return [days, hours, minutes, seconds].join(':')

$ ->
  now = Date.now()
  target = new Date(2013, 2, 25, 18)
  difference = target - now
  console.log ms_to_days_hours_minutes_seconds(difference)
