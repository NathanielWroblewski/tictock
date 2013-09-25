window.Time or= {}

class Time.ClockView extends Backbone.View

  render: ->
    title = 'Time'
    @$el.html(title)
