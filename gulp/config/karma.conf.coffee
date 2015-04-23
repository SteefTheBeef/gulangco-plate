module.exports = (config) ->
  config.set
    preprocessors: {
      'src/**/*.coffee': ['coffee', 'coverage']
      'src/**/*.tpl.html': ['ng-html2js']
    },
    coffeePreprocessor: {
      options: {
        bare: true,
        sourceMap: false
      },
      transformPath: (path) ->
        path.replace(/\.coffee$/, '.js')
    },
    ngHtml2JsPreprocessor: {
      moduleName: 'test-templates'
    },
    reporters: ['progress','coverage'],
    coverageReporter: {
      type : 'html',
      dir : 'coverage/'
    },
    basePath: '../..',
    files: [
      'bower_components/jquery/dist/jquery.js'
      'bower_components/angular/angular.js'
      'bower_components/angular-mocks/angular-mocks.js'
      'src/**/*.html'
      'src/config/registerModules.coffee'
      'src/**/*.coffee'
      'src/**/*.spec.coffee'
    ],
    frameworks: ['jasmine'],
    browsers: ['Chrome'],

    port: 9876,
    captureTimeout: 20000,
    singleRun: false,
    reportSlowerThan: 500,
    LogLevel: config.LOG_DEBUG,
    plugins: [
      'karma-jasmine'
      'karma-chrome-launcher'
      'karma-coffee-preprocessor'
      'karma-ng-html2js-preprocessor'
      'karma-coverage'
    ]
