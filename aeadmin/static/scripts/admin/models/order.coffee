define [
  'lib/ember'
  'lib/ember-data'

], (Em, DS) ->

  #v = App.Variant = DS.Model.extend
    #name: DS.attr 'string'
    #price: DS.attr 'number'
    #quantity: DS.attr 'number'

  #x = App.Product = DS.Model.extend
    #name: DS.attr 'string'
    #description: DS.attr 'string'
    #sku: DS.attr 'string'
    #price: DS.attr 'number'
    #variants: DS.hasMany 'App.Variant', {embedded: true}
  x = 1
  return x
