class window.AppView extends Backbone.View

  template: _.template '
    <div class="main">
      <h1>Blackjack</h1>
      <button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="redeal">New Game</button>
      <div class="player-hand-container"></div>
      <div class="dealer-hand-container"></div>
    </div>
  '

  events:
    "click .hit-button": -> @model.get('playerHand').hit()
    "click .stand-button": ->
      @model.stand()
      @disableButtons()

    "click .redeal": ->
      @enableButtons()


  initialize: ->
    @model.get('playerHand').on 'bust', =>
      @disableButtons()
      alert "You busted."
    @model.get('dealerHand').on 'bust', ->
      alert "Dealer busted."
    @render()

  disableButtons: ->
    $('.hit-button').attr('disabled','disabled')
    $('.stand-button').attr('disabled','disabled')

  enableButtons: ->
    $('.hit-button').removeAttr('disabled')
    $('.stand-button').removeAttr('disabled')

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
