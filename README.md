L
=

Lightweight localization solution using JSON format

## Usage

Create your locales in a JSON file e.g. _locales.json_:

    {
      "brazil":{
        "br": "Brasil",
        "de": "Brasilien",
        "en": "Brazil"
      },
      "greeting":{
        "br": "Oi {0}.",
        "de": "Hallo {0}.",
        "en": "Hello {0}."
      }
    }

Syntax in CoffeeScript

    L.changeLocale "en"
    L.initFile "locales.json", ->
      console.log L.get("brazil") # will output "Brazil"
      console.log L.get("greeting", "Dude") # will output "Hello Dude."

## Tests

Unit tests are build on top of [Mocha](http://mochajs.org/) and [should](https://github.com/visionmedia/should.js):

    $ make test

## Docs

Docs are generated using [docco](http://jashkenas.github.com/docco/) and [Pygments](http://pygments.org).

    $ sudo easy_install Pygments
    $ make docs

## License

[Apache License 2](http://www.apache.org/licenses/LICENSE-2.0.html)
