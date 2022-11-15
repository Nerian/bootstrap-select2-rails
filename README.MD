# Bootstrap Select2 for Rails

[![Gem Version](https://badge.fury.io/rb/bootstrap-select2-rails.png)](http://badge.fury.io/rb/bootstrap-select2-rails)

bootstrap-select2-rails project integrates a Select2 and Bootstrap 5 theme with the Rails assets pipeline.

http://github.com/Nerian/bootstrap-select2-rails

## Original code

* https://github.com/select2/select2
* https://github.com/apalfrey/select2-bootstrap-5-theme


## Install

Include bootstrap-select2-rails in Gemfile;

``` ruby
gem 'bootstrap-select2-rails'
```

or you can install from latest build;

``` ruby
gem 'bootstrap-select2-rails', :require => 'bootstrap-select2-rails',
                              :git => 'git://github.com/Nerian/bootstrap-select2-rails.git'
```

and run bundle install.

## Versioning

We will follow the same version as Select2, with a minor version addition should it be needed.

## Configuration

Add this line to app/assets/stylesheets/application.css

``` css
 *= require bootstrap-select2-rails
```

Or using scss:

``` scss
 @import 'bootstrap-select2-rails';
```

Add this line to app/assets/javascripts/application.js

``` javascript
//= require bootstrap-select2-rails
```

The default includes support for english. You can fine tune the included locales to suit your needs:

```javascript
//= require bootstrap-select2-rails
//= require bootstrap-select2-rails/locales/es.js
//= require bootstrap-select2-rails/locales/fr.js
```

## Using bootstrap-select2-rails

See official documentation on https://select2.org/


## Keeping this repo up to date with the source repos

Please use the rake task to update the assets.

Examples :

```bash
thor utilities:update
```

## Questions? Bugs?

Use Github Issues.

## License
Copyright (c) 2022 Gonzalo Rodríguez-Baltanás Díaz

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
