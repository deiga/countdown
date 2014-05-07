nonna_inc = new Date(2013, 2, 25, 18, 5)
helsinki_inc = new Date(2013, 3, 23, 30)
home_inc = new Date(2013, 4, 24, 23, 30)

steeri_inc = new Date(2014, 5, 8, 16, 0)

if Date.now() > nonna_inc
    if Date.now() > helsinki_inc
        document.target_date = home_inc
    else
        document.target_date = helsinki_inc
else
    document.target_date = steeri_inc

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
  return { 'days': days, 'hours': hours.substr(-2), 'minutes' : minutes.substr(-2), 'seconds' : seconds.substr(-2)}

refresh_timer = () ->
  difference = document.target_date - Date.now()
  difference = ms_to_days_hours_minutes_seconds(difference)
  timer = $('.timer')
  if parseInt(timer.find('.days').text(), 10) != difference.days
    timer.find('.days').text(difference.days)
  if parseInt(timer.find('.hours').text(), 10) != difference.hours
    timer.find('.hours').text(difference.hours)
  if parseInt(timer.find('.minutes').text(), 10) != difference.minutes
    timer.find('.minutes').text(difference.minutes)
    .next().text(difference.minutes)
  timer.find('.seconds').text(difference.seconds)

$ ->
  refresh_timer()
  setInterval(refresh_timer, 1000)
