window.Time or= {}

class Time.PlacesView extends Backbone.View

  intialize: ->

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

  fetchLocation: (event) ->
    event.preventDefault()
    @.revealResults()

  revealResults: ->
    @$el.append @template()
