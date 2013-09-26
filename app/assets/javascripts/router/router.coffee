window.Time or= {}

class Time.Router extends Backbone.Router

  initialize: ->
    @clock = new Time.Clock()
    @clockView = new Time.ClockView
      model: @clock
    @logoView = new Time.LogoView()
    @placesView = new Time.PlacesView
      el: '.places-form'
    @clockView.render()
    @placesView.render()
    @logoView.render()
    $('#app').append @placesView.el
    $('#clock').append @logoView.el

  start: ->
    Backbone.history.start
      pushState: true

  routes:
    '': 'index'

  index: ->
    @clockView.render()
    $('#app').append @clockView.el
    @logoView.render()
    $('#clock').append @logoView.el



$ ->
  time = new Time.Router()
  time.start()
