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
        files: ['src/**.coffee']
        tasks: ['coffeelint:sources', 'coffee:compile']

    # Check for syntax
    coffeelint:
      options:
        configFile: 'coffeelint.json'
      gruntfile: ['Gruntfile.coffee']
      sources: ['src/**.coffee']

    # Compile files
    coffee:
      compile:
        expand: true
        flatten: true
        cwd: 'src/'
        src: ['**/*.coffee']
        dest: './'
        ext: '.js'

  # load plugins
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  # default task(s)
  grunt.registerTask 'default', ['coffeelint:sources', 'coffee:compile', 'watch']

  # other tasks

  # don't return nothing
  return