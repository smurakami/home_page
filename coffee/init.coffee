# global scope
global = this

# main class
class Main
  constructor: ->
    U.phello()
    @initCss()
    return
  initCss: ->

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