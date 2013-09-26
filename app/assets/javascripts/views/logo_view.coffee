window.Time or= {}

class Time.LogoView extends Backbone.View

  initialize: ->
    @width = 85
    @half  = @width * .5
    @face  = '#CFF09E'
    @hands = '#3B8686'
    @canvas = Raphael 'clock', @width, @width
    @clockface = @canvas.circle @half, @half, @width * .475

  render: ->
    @windClock()

  windClock: ->
    @renderClock()
    @updateClock()
    setInterval @updateClock, 1000

  renderClock: ->
    @hour_hand = @canvas.path 'M' + @half + ' ' + @half +
      'L' + @half + ' ' + @half * .5
    @minute_hand = @canvas.path 'M' + @half + ' ' + @half +
      'L' + @half + ' ' + @width * .2
    @second_hand = @canvas.path 'M' + @half + ' ' + @width * .55 +
      'L' + @half + ' ' + @width * .125
    @center_pin = @canvas.circle @half, @half, @width * .025

    for number in [0..11]
      start_x = @cosPath number
      start_y = @sinPath number
      end_x = @cosPath number
      end_y = @sinPath number

      @hour_tick = @canvas.path 'M' + start_x + ' ' +
        start_y + 'L' + end_x + ' ' + end_y

      @colorClock()

  colorClock: ->
    @clockface.attr
      'fill': @face
      'stroke': @hands
      'stroke-width': @width * .015
    @hour_tick.attr 'stroke', @hands
    @hour_hand.attr
      'stroke': @hands
      'stroke-width': @width * .03
    @minute_hand.attr
      'stroke': @hands
      'stroke-width': @width * .02
    @second_hand.attr
      'stroke': @hands
      'stroke-width': @width * .01
    @center_pin.attr
      'fill': @hands
      'stroke': @hands

  sinPath: (num) ->
    @half + Math.round((@width * .4) * Math.sin(30 * num * Math.PI/180))

  cosPath: (num) ->
    @half + Math.round((@width * .4) * Math.cos(30 * num * Math.PI/180))

  updateClock: =>
    now = new Date()
    hours = now.getHours()
    minutes = now.getMinutes()
    seconds = now.getSeconds()

    @hour_hand.rotate 30 * hours + (minutes/2.5), @half, @half
    @minute_hand.rotate 6 * minutes, @half, @half
    @second_hand.rotate 6 * seconds, @half, @half
