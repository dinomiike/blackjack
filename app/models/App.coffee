#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

  stand: ->
    playerScore = @get('playerHand').getScore()
    dealerScore = @dealerGoes()
    # alert if playerScore > dealerScore  then 'you win' else 'you lose'
    if playerScore > dealerScore
      alert 'you win'
    else if playerScore == dealerScore
      alert 'tie'
    else
      alert 'you lose'

  dealerGoes: ->
    dealer = @get('dealerHand')
    dealer.reveal()
    while dealer.scores()[0]<17
      dealer.hit()
    dealer.getScore()