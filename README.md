# README

To run this project do the following steps:

* Run `bundle install`
* Run `rails db:create`
* Run `rails db:migrate`
* Run `rails db:seed`
* Run `bundle exec rake sunspot:solr:start`
* And finally to serve the API, run `rails s`

Frontend can be located at: [Frontend-Questions-API](https://github.com/gabidavila/module3-js-frontend)

For the front-end you need NodeJS `http-server` module:

Run:
* `npm install http-server -g`
* `http-server -c-1`
