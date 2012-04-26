define [
  'lib/ember'
  'lib/ember-data'

], (Em, DS) ->

  x = DS.Model.extend
    application_title: DS.attr 'string'
    secret_key: DS.attr 'string'
    default_from_email: DS.attr 'string'
    cookie_max_age: DS.attr 'number'
    cookie_domain: DS.attr 'string'
    cookie_key: DS.attr 'string'
    cookie_secure: DS.attr 'boolean'
    cookie_path: DS.attr 'string'
    cookie_httponly: DS.attr 'string'
    user_model: DS.attr 'string'
    title: DS.attr 'string'
  return x
