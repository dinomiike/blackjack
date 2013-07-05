#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->
    playerScore = @get('playerHand').getScore()
    dealerScore = @dealerGoes()

  dealerGoes: ->
    dealer = @get('dealerHand')
    dealer.reveal()
    while dealer.scores()[0]<17
      dealer.hit()
    dealer.getScore()