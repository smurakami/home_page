// Generated by CoffeeScript 1.6.3
(function() {
  var ImgAnimationCanvas, M, Main, U, global;

  global = this;

  Main = (function() {
    var ANIMATION_IMG_NUM;

    ANIMATION_IMG_NUM = 4;

    function Main() {
      this.initMainCanvas();
      this.startLoop();
      return;
    }

    Main.prototype.initMainCanvas = function() {
      var i, img_srcs;
      img_srcs = (function() {
        var _i, _results;
        _results = [];
        for (i = _i = 0; 0 <= ANIMATION_IMG_NUM ? _i < ANIMATION_IMG_NUM : _i > ANIMATION_IMG_NUM; i = 0 <= ANIMATION_IMG_NUM ? ++_i : --_i) {
          _results.push("img/chara" + i + ".png");
        }
        return _results;
      })();
      return this.mainCanvas = new ImgAnimationCanvas('main-canvas', img_srcs);
    };

    Main.prototype.preloadImgs = function() {
      var i, _i, _results;
      _results = [];
      for (i = _i = 0; 0 <= ANIMATION_IMG_NUM ? _i < ANIMATION_IMG_NUM : _i > ANIMATION_IMG_NUM; i = 0 <= ANIMATION_IMG_NUM ? ++_i : --_i) {
        _results.push($('<img>').attr('src', "img/chara" + i + ".png"));
      }
      return _results;
    };

    Main.prototype.startLoop = function() {
      this.mainCanvas.startAnimation();
    };

    return Main;

  })();

  ImgAnimationCanvas = (function() {
    var stopAnimation;

    function ImgAnimationCanvas(canvasId, img_srcs) {
      var img, src, _i, _len;
      this.canvas = document.getElementById(canvasId);
      this.width = this.canvas.width;
      this.height = this.canvas.height;
      this.ctx = this.canvas.getContext('2d');
      this.imgs = [];
      for (_i = 0, _len = img_srcs.length; _i < _len; _i++) {
        src = img_srcs[_i];
        img = new Image();
        img.src = src;
        this.imgs.push(img);
      }
      this.maxflame = this.imgs.length;
      this.flame = 0;
    }

    ImgAnimationCanvas.prototype.startAnimation = function() {
      var mainLoop, self;
      self = this;
      mainLoop = function() {
        self.update();
        return self.draw();
      };
      return this.timer = 　setInterval(mainLoop, 100);
    };

    stopAnimation = function() {
      return clearInterval(this.timer);
    };

    ImgAnimationCanvas.prototype.update = function() {
      this.flame++;
      if (this.flame >= this.maxflame) {
        return this.flame = 0;
      }
    };

    ImgAnimationCanvas.prototype.draw = function() {
      this.ctx.clearRect(0, 0, this.width, this.height);
      return this.ctx.drawImage(this.imgs[this.flame], 0, 0, this.width, this.height);
    };

    return ImgAnimationCanvas;

  })();

  global.Util = {
    randomInt: function(n) {
      return M.floor(M.random() * n);
    },
    generateRandomColor255: function(chroma) {
      var color_elem;
      if (chroma == null) {
        chroma = 255;
      }
      color_elem = [255, 255 - chroma, U.randomInt(255)].shuffle();
      return {
        r: color_elem[0],
        g: color_elem[1],
        b: color_elem[2]
      };
    }
  };

  Array.prototype.shuffle = function() {
    var buf;
    buf = [];
    while (this.length > 0) {
      buf.push(this.splice(U.randomInt(this.length), 1)[0]);
    }
    while (buf.length > 0) {
      this.push(buf.pop());
    }
    return this;
  };

  M = Math;

  U = Util;

  $(function() {
    return global.main = new Main;
  });

}).call(this);
