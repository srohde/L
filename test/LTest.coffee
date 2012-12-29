should = require 'should'
L = require '../src/L'

describe 'L', ->

  before () ->
    L.changeLocale "br"
    L.initJSON
      brazil:
        br: "Brasil"
        en: "Brazil"
        de: "Brasilien"
      title:
        br: "Foo {0} Bar {1} Test"
        de: "Foo {0} Bar {1} Test"
        en: "Foo {0} Bar {1} Test"


  describe '#get()', ->
    it 'should return the value for a string key with default locale', ->
      L.get("brazil").should.equal "Brasil"

    it 'should return replace arguments', ->
      L.get("title", "a", "b").should.equal "Foo a Bar b Test"

    it 'should return the value the changed locale', ->
      L.changeLocale "en"
      L.get("brazil").should.equal "Brazil"
      L.changeLocale "de"
      L.get("brazil").should.equal "Brasilien"

    it 'should return the value with ??? when key not found', ->
      L.get("brasil").should.equal "brasil???"