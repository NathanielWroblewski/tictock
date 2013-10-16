window.Time or= {}

class Time.PlaceView extends Backbone.View

  initialize: ->
    @place = ''
    @smalltime = ''
    @bigtime = ''
    @url = ''

  render: ->

  template: ->
    _.template '' +
      '<div class="row show-for-small hide-for-large">' +
        '<div class="small-offset-2 small-20 columns small-city">' +
          "<h1>#{@place}</h1>" +
        '</div>' +
      '</div>' +
      '<div class="row show-for-small hide-for-large">' +
        '<div class="small-offset-2 small-20 columns small-time">' +
          "<h1>#{@smalltime}</h1>" +
        '</div>' +
      '</div>' +
      '<div class="row hide-for-small show-for-large">' +
        '<div class="large-6 columns city">' +
          "<h3>#{@place}</h3>" +
        '</div>' +
        '<div class="large-18 columns timebox-container">' +
          '<ul class="large-block-grid-24">' +
            @timeline() +
          '</ul>' +
        '</div>' +
      '</div>'

  events:
    'submit form': 'fetchLocation'

  fetchLocation: (event) ->
    event.preventDefault()
    @place = $('#search-places').val()
    @url = '/places/' + encodeURIComponent($('#search-places').val())
    $.get @url, (data) =>
      @smalltime = @formatSmallTime(data.time)
      @bigtime =  parseInt data.time.substring(11, 13)
      @revealResults()

  revealResults: ->
    $('.results').append @template()

  timeline: ->
    hours = []
    for num in [0..23]
      color = if @bigtime is num then 'now' else 'hour'
      ampm = if num < 11 or num == 23 then 'am' else 'pm'
      hours.push "#{'<li><h3 class=' + color + '>' + (num % 12 + 1) +
        '</h3><p class="ampm ' + color + '">' + ampm + '</p></li>'}"
    hours.join ''

  formatSmallTime: (time) ->
    start = if time[11] is 0 then 12 else 11
    time.substring(start, 16)
