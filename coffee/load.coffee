"use strict"

config =
  baseUrl: "/static/js/"
  paths:
    jquery: "vendor/jquery"
    cookie: "vendor/jquery.cookie"
    appear: "vendor/jquery.appear"
    underscore: "vendor/underscore"
    backbone: "vendor/backbone"
    chaplin: "vendor/chaplin"
    moment: "vendor/moment"
    moment_ru: "vendor/moment_ru"
    bootstrap: "vendor/bootstrap"
    tinycon: "vendor/tinycon"
    highlight: "vendor/highlight"
    marked: "vendor/marked"
    pikaday: "vendor/pikaday"
  shim:
    appear:
      deps: ["jquery"]
    underscore:
      exports: "_"
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"
    bootstrap:
      deps: ["jquery"]
    tinycon:
      exports: "Tinycon"
    pikaday:
      exports: "Pikaday"
  deps: ["bootstrap", "cookie", "appear"]
  urlArgs: "v=" + (new Date()).getTime()

if exports?
  # Run from Node. Export application config.
  exports.config = config
else
  # Development usage.
  requirejs.config config
  require [
    "meow_application"
  ], (MeowApplication) ->
    app = new MeowApplication()
    app.initialize()
