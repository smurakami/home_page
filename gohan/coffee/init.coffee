# global scope
global = this

# main class
class Main
  ANIMATION_IMG_NUM = 4
  constructor: ->
    U.phello()
    @initCss()
    @preloadImgs()
    @startAnimation()
    return

  initCss: ->
    return

  preloadImgs: ->
    for i in [0...ANIMATION_IMG_NUM]
      $('<img>').attr 'src', "img/chara#{i}.png"

  startAnimation: ->
    i = 0
    update = ->
      $('#main>img').attr 'src', "img/chara#{i}.png"
      i++
      if i == ANIMATION_IMG_NUM
        i = 0
      return
    setInterval update, 100
    return


# utility
global.Util =
  phello: ->
    console.log "hello"

  randomInt: (n) -> M.floor M.random() * n

  generateRandomColor255: (chroma = 255) ->
    color_elem = [255, 255 - chroma, U.randomInt(255)].shuffle()
    return {r: color_elem[0], g: color_elem[1], b: color_elem[2]}


# extend builtin class
Array.prototype.shuffle = ->
  buf = []
  while this.length > 0
    buf.push this.splice(U.randomInt(this.length), 1)[0]
  while buf.length > 0
    this.push buf.pop()
  return this


# manage names
M = Math
U = Util

$ ->
  global.main = new Main