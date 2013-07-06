class window.Hand extends Backbone.Collection

  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    hitCard = @deck.pop()
    console.log(@)
    @add(hitCard).last(
    if @getScore() < 0
      console.log('busted')
      @trigger('bust')
    hitCard

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  getScore: ->
    playerScore = @scores()
    if playerScore.length > 1
      if playerScore[1] < 22
        playerScore = playerScore[1]
      else
        playerScore = playerScore[0]
    else
      playerScore = playerScore[0]

    if playerScore > 21
      -1
    else
      playerScore

  reveal: ->
    @at(0).flip()