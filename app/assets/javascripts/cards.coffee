# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  # generates the html for the cards that are face-up
  generate_html = (cards) ->
    cards.forEach (card) ->
      $("#cards").append '<div class="mdl-cell mdl-cell--2-col">
        <div class="mdl-card mdl-shadow--4dp" id=' + card.replace(/\ /g, "-") + '>
          <div class="mdl-card__title">
            <h2 class="mdl-card__title-text">' + card + '</h2>
          </div>
          <div class="mdl-card__supporting-text"></div>
        </div>
      </div>'

  # determines who had the most points
  get_winner = () ->
    scores = $(".player-score").text().split("")

    max = scores[0]

    i = 1
    while i < scores.length
      if scores[i] > max
        max = scores[i]
      i++

    winners = []
    i = 0
    while i < scores.length
      if scores[i] == max
        winners.push $(".player-score").parent().find(".player-name")[i].innerHTML.trim()
      i++

    winners.toString()

  # simulates the next 'phase' which is the moment when a new set is found
  window.next_phase = () ->
    console.log window.flipped_up_cards

    # gets the set (if one exists) from the current list of cards
    $.post(
      "/get_set.json"
      {cards:window.flipped_up_cards}
      (data, textStatus, jqXHR) ->

        # if a set is found
        if data.set.length > 0
          data.set.forEach (card) ->
            card_node = $("#" + card.replace(/\ /g, "-"))[0]
            card_node.style.backgroundColor = "bisque"
            index = window.flipped_up_cards.indexOf(card);
            if index >= 0
              window.flipped_up_cards.splice( index, 1 );

            setTimeout(() ->
              card_node.parentNode.style.display = "none"
            ,1000)

          score = $(".player-score")[Math.floor(Math.random() * (4))]
          score.innerHTML = (Number.parseInt(score.innerHTML)+1) + ""
        else
          # if there are still cards in the deck
          if window.deck.length > 0
            new_cards = window.deck.splice(0,3)
            window.flipped_up_cards = window.flipped_up_cards.concat(new_cards)
            generate_html(new_cards)
          else
            window.location.href = '/winner?name=' + get_winner();
    )

  # toggles the autoplay feature
  autoplay = () ->
    if toggled_on
      setTimeout(() ->
        window.next_phase()
        autoplay()
      ,1000)

  window.deck = JSON.parse $("#cards")[0].dataset.deck
  window.flipped_up_cards = window.deck.splice(0,12)
  toggled_on = false

  generate_html(window.flipped_up_cards)

  $("#autoplay").change (() ->
    toggled_on = !toggled_on
    autoplay()
  )
