vows = require 'vows'
assert = require 'assert'

require('../../../src/core/string/ruby') String

vows
  .describe('Module core extension Ruby')
  .addBatch
    'Testing gsub':
      topic: 'bullet'

      'when no args': (topic) ->
        assert.equal topic.gsub(), 'bullet'

      'when only 1 arg': (topic) ->
        assert.equal topic.gsub(/./), 'bullet'

      'when given proper args': (topic) ->
        assert.equal topic.gsub(/[aeiou]/, '*'), 'b*ll*t'

      'when replacement is a function':
        'with many groups': (topic) ->
          str = topic.gsub /([aeiou])(.)/, ($) ->
            "<#{$[1]}>#{$[2]}"
          assert.equal str, 'b<u>ll<e>t'

        'with no groups': (topic) ->
          str = topic.gsub /[aeiou]/, ($) ->
            "<#{$[1]}>"
          assert.equal str, 'b<u>ll<e>t'

  .export(module)
