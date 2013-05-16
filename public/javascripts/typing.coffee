CharTone = Backbone.Model.extend()

CharToneList = Backbone.Collection.extend
  model: CharTone  

TypingView = Backbone.View.extend
  initialize: ->
    @pos = 0
    @tone_index = 0
  el: document
  events:
    "keydown": "onKeydown"
  onKeydown: (event) ->
    console.log event.keyCode
    this
  setText: (text) ->
    _.each text.split(''), (c, i) ->
      ch = new CharTone(pos: i * 160, ch: c)
      new CharView(model: ch).render().el
  timer: (e) ->
    @pos += 2
    $(".char-container").css(left: -@pos)
    setTimeout((=> @timer()), 0)

CharView = Backbone.View.extend
  render: ->
    @$el.addClass("typed-char")
      .text(@model.get("ch"))
      .css(left: @model.get("pos"))
    $(".char-container").append @el
    this

$ ->
  typingView = new TypingView()
  typingView.setText "root.Suggestions = Backbone.Collection.extend"
  typingView.timer()


