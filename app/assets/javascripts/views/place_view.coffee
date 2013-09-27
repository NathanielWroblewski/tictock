window.Time or= {}

class Time.PlaceView extends Backbone.View

  intialize: ->

  model: ->
    new Time.Place()

  render: ->

  template: ->
    _.template ''+
      '<div class="row">' +
        '<div class="small-offset-1 small-10 columns results"'+
          '<h1>Results</h1>' +
        '</div>' +
      '</div>'

  events:
    'submit form': 'fetchLocation'
    'reset': 'alertTime'

  alertTime: ->
    alert @model.time
    alert @model.place

  fetchLocation: (event) ->
    event.preventDefault()
    @model.place = $('#search-places').val()
    @model.fetch
      id: 1
      place: @model.place

  revealResults: ->
    @$el.append @template()
