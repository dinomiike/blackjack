class window.AppView extends Backbone.View

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": ->
      @model.stand()
      $('.hit-button').attr('disabled','disabled')
      $('.stand-button').attr('disabled','disabled')

  initialize: ->
    @model.get('playerHand').on 'bust', ->
      alert "You busted."
    @model.get('dealerHand').on 'bust', ->
      alert "Dealer busted."
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
