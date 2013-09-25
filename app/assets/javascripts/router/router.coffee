window.Time or= {}

class Time.Router extends Backbone.Router

  initialize: ->
    @clock = new Time.Clock()
    @clockView = new Time.ClockView
      model: @clock
    @clockView.render()
    $('#app').append @clockView.el

  start: ->
    Backbone.history.start
      pushState: true

  routes:
    '': 'index'

  index: ->
    console.log 'hey'
    @clockView.render()
    $('#app').append @clockView.el



$ ->
  time = new Time.Router()
  debugger
  time.start()
