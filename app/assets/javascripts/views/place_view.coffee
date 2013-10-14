window.Time or= {}

class Time.PlaceView extends Backbone.View

  initialize: ->
    @place = ''
    @time = ''
    @url = ''

  render: ->

  template: ->
    _.template '' +
        '<div class="row show-for-small hide-for-large">' +
          '<div class="small-offset-2 small-20 columns">' +
            "<h1>#{@place}</h1>" +
          '</div>' +
        '</div>' +
        '<div class="row show-for-small hide-for-large">' +
          '<div class="small-offset-2 small-20 columns">' +
            "<h1>#{@time}</h1>" +
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
        '</div>' +
      '</div>'

  events:
    'submit form': 'fetchLocation'

  fetchLocation: (event) ->
    event.preventDefault()
    @place = $('#search-places').val()
    @url = '/places/' + encodeURIComponent($('#search-places').val())
    $.get @url, (data) =>
        @.time = data.time
        @.revealResults()

  revealResults: ->
    $('.results').append @template()

  timeline: ->
    hours = []
    hours.push("#{'<li><h3>' + (num%12 + 1) + '</h3></li>'}") for num in [0..23]
    hours.join ''
