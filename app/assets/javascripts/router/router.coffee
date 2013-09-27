window.Time or= {}

class Time.Router extends Backbone.Router

  initialize: ->
    @places = new Time.Place()
    @logoView = new Time.LogoView()
    @placeView = new Time.PlaceView
      el: '.places-form'
      model: @places
    @placeView.render()
    @logoView.render()
    $('#app').append @placeView.el
    $('#clock').append @logoView.el

  start: ->
    Backbone.history.start
      pushState: true

  routes:
    '': 'index'

  index: ->
    @placeView.render()
    $('#app').append @placeView.el
    @logoView.render()
    $('#clock').append @logoView.el



$ ->
  time = new Time.Router()
  time.start()
