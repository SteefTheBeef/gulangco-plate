gulp = require 'gulp'
plumber = require 'gulp-plumber'
streamify = require('gulp-streamify')
minifyCSS = 'gulp-minify-css'
less = require 'gulp-less'

module.exports = (sourceFiles, destination, minify = false) ->
  if minify
    stream = gulp.src(sourceFiles)
    .pipe(streamify(less()))
    .pipe(minifyCSS())
    .pipe(gulp.dest(destination))
  else
    stream = gulp.src(sourceFiles)
    .pipe(plumber (err) ->
      console.log "\nLESS ERROR\n" + err.message + "\n"
      @emit('end')
    )
    .pipe(less())
    .pipe(gulp.dest(destination))
  stream


