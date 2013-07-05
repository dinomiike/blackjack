describe 'deck', ->
  deck = null
  hand = null
  dealerHand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    dealerHand = deck.dealDealer()

  describe 'deal', ->
    it "should give two cards to the player", ->
      expect(hand.length).toBe 2

    it "should give two cards to the dealer, the first one hidden", ->
      expect(dealerHand.length).toBe 2
      expect(dealerHand.at(0).get 'revealed').toBe false

  describe 'hit', ->
    it "should give the last card from the deck", ->
      expect(deck.length).toBe 48
      expect(deck.last()).toEqual hand.hit()
      expect(deck.length).toBe 47
      expect(deck.last()).toEqual dealerHand.hit()
      expect(deck.length).toBe 46