# global scope
global = this

# main class
class Main
  ANIMATION_IMG_NUM = 4
  constructor: ->
    @initMainCanvas()
    @startMainAnimation()
    return

  initMainCanvas: ->
    img_srcs = ("img/chara#{i}.png" for i in [0...ANIMATION_IMG_NUM])
    @mainCanvas = new ImgAnimationCanvas('main-canvas', img_srcs)

  preloadImgs: ->
    for i in [0...ANIMATION_IMG_NUM]
      $('<img>').attr 'src', "img/chara#{i}.png"

  startMainAnimation: ->
    @mainCanvas.startAnimation()
    return


# image animation canvas
class ImgAnimationCanvas
  constructor: (canvasId, img_srcs) ->
    @canvas = document.getElementById(canvasId)
    @width  = @canvas.width
    @height = @canvas.height
    @ctx = @canvas.getContext('2d')
    @imgs = []
    for src in img_srcs
      img = new Image()
      img.src = src
      @imgs.push img
    @maxflame = @imgs.length
    @flame = 0

  startAnimation: ->
    self = this
    mainLoop = ->
      self.update()
      self.draw()
    @timer =　setInterval mainLoop, 100

  stopAnimation = ->
   clearInterval(@timer)

  update: ->
    @flame++
    if @flame >= @maxflame then @flame = 0

  draw: ->
    @ctx.clearRect(0, 0, @width, @height)
    @ctx.drawImage(@imgs[@flame], 0, 0, @width, @height)


# utility
global.Util =
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
