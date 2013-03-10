document.target_date = new Date(2013, 2, 25, 18)
ms_to_days_hours_minutes_seconds = (time_in_ms) ->
  second = 1000
  minute = 60 * second
  hour = 60 * minute
  day = 24 * hour
  days = Math.floor( time_in_ms / day )
  time_wo_days = time_in_ms - days * day
  hours = '0' + Math.floor ( time_wo_days / hour )
  time_wo_hours = time_wo_days - hours * hour
  minutes = '0' + Math.floor ( time_wo_hours / minute )
  time_wo_minutes = time_wo_hours - minutes * minute
  seconds = '0' + Math.floor (time_wo_minutes / second)
  return [days, hours.substr(-2), minutes.substr(-2), seconds.substr(-2)].join(':')

refresh_timer = () ->
  difference = document.target_date - Date.now()
  difference_string = ms_to_days_hours_minutes_seconds(difference)
  $('.timer').replaceWith("<div class='timer'>" + difference_string + "</div>")

$ ->
  refresh_timer()
  setInterval(() ->
    refresh_timer()
  , 1000)
