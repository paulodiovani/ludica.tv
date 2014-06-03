module.exports = (grunt) ->

  # project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Observe file modifications
    watch:
      gruntfile:
        files: ['Gruntfile.coffee']
        tasks: ['coffeelint:gruntfile']

      makecoffee:
        files: ['src/**/*.coffee']
        tasks: ['coffeelint:sources', 'coffee:node', 'coffee:browser']
        options:
          spawn: false

    # Check for syntax
    coffeelint:
      gruntfile: ['Gruntfile.coffee']
      sources: ['src/**/*.coffee']
      options:
        configFile: 'coffeelint.json'

    # Compile files
    coffee:
      node:
        expand: true
        flatten: false
        cwd: 'src/controllers/'
        src: ['**/*.coffee']
        dest: './controllers/'
        ext: '.js'
      browser:
        expand: true
        flatten: false
        cwd: 'src/public/js/'
        src: ['**/*.coffee']
        dest: './public/js/'
        ext: '.js'

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # default task(s)
  grunt.registerTask 'default', [
    'coffeelint:gruntfile', 'coffeelint:sources',
    'coffee:node', 'coffee:browser',
    'debug',
    'watch'
  ]

  # other tasks
  grunt.registerTask 'debug', ->
    require './debug.js'

  # don't return nothing
  return