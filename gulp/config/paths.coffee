less = 'less/'

obj =
  build:
    directories:
      base: 'build/'
      tmp: 'build/.tmp/'
      js: 'build/src/'
      vendor: 'build/vendor/'
      css: 'build/assets/css/'
      fonts: 'build/assets/fonts/'
  dist:
    directories:
      base: 'dist/'
      tmp: 'dist/.tmp/'
      js: 'dist/js/'
      css: 'dist/css/'
  vendor:
    js: [
      'bower_components/jquery/dist/jquery.js'
      'bower_components/angular/angular.js'
      'bower_components/angular-aria/angular-aria.js'
      'bower_components/angular-animate/angular-animate.js'
      'bower_components/angular-resource/angular-resource.js'
      'bower_components/angular-sanitize/angular-sanitize.js'
      'bower_components/angular-strap/dist/angular-strap.js'
      'bower_components/angular-strap/dist/angular-strap.tpl.js'
      'bower_components/angular-ui-router/release/angular-ui-router.js'
    ]
    fonts: [
      'bower_components/ionicons/fonts/*'
    ]
  coffee:
    base: 'src/'
    files: [
      'src/config/registerModules.coffee'
      'src/common/**/*.coffee'
      'src/**/*.coffee'
      'src/app.coffee'
      '!src/**/*.spec.*'
    ]
  inject: {}
  less:
    base: less
    build: [
        '!' + less + 'production.less'
        less + '**/*.less'
    ]
    dist: './less/production.less'
  index: './index.html'
  html:
    watch: 'src/**/*'
    files: './src/**/*.html'
    tpl: 'src/**/*.tpl.html'
  fonts: [

  ]

obj.inject.coffeeToJs = () ->
  obj.coffee.files.map (filename) -> obj.build.directories.base + filename.replace('.coffee', '.js')

obj.inject.lessToCss = () ->
  obj.build.directories.css + '**/*.css'

module.exports = obj