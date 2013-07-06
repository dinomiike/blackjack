#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'playerScore'
    @set 'dealerScore'

  stand: ->
    @set 'playerScore', @get('playerHand').getScore()
    @set 'dealerScore', @dealerGoes()

  dealerGoes: ->
    dealer = @get('dealerHand')
    dealer.reveal()
    while dealer.scores()[0]<17
      dealer.hit()
    dealer.getScore()

  redeal: =>
    if (@get('deck').length > 20)
      console.log(@get('deck').length)
      @set 'playerHand', @get('deck').dealPlayer()
      @set 'dealerHand', @get('deck').dealDealer()
      console.log(@get('deck').length)
    else
      @set 'deck', deck = new Deck()