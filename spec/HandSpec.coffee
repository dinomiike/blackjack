describe 'hand', ->
  deck = null
  hand = null
  dealer = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()
    hand.pop()
    hand.pop()
    hand.add({rank: 0, suit: 2, value: 10})
    hand.add({rank: 1, suit: 1, value: 1})
    dealer = deck.dealPlayer()
    debugger;

  describe 'scores', ->
    it "should return one score for hands without an ace", ->
      hand.pop()
      hand.add({rank: 5, suit: 2, value: 5})
      expect(hand.scores()).toEqual([15])

    it "should return two scores for a hand with an ace", ->
      expect(hand.scores()).toEqual([11,21])

  describe 'getScore', ->
    it "should return a single number of the highest possible score", ->
      expect(hand.getScore()).toEqual(21)

    it "should return -1 if the player busts", ->
      hand.add({rank: 7, suit: 2, value: 7})
      hand.add({rank: 7, suit: 4, value: 7})
      expect(hand.getScore()).toEqual(-1)