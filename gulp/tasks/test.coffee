gulp = require 'gulp'
karma = require 'gulp-karma'

module.exports = (action = 'run') ->
  # put some bogus path here to trick it into
  # using the paths in karma.conf.coffee instead.

  gulp.src('./bogus')
  .pipe(karma({ configFile: './gulp/config/karma.conf.coffee', action: action }))
