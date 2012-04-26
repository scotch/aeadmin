define [
  'lib/ember'
  'lib/ember-data'
], (Ember, DS) ->

  get = Ember.get
  set = Ember.set
  getPath = Ember.getPath

  URL_PREFIX = '/api/v1'

  return DS.Adapter.create(
    createRecord: (store, type, model) ->
      root = @rootForType(type)
      data = {}
      data[root] = get(model, "data")
      @ajax "/" + @pluralize(root), "POST",
        data: JSON.stringify(data)
        success: (json) ->
          store.didCreateRecord model, json[root]

    createRecords: (store, type, models) ->
      return @_super(store, type, models)  if get(this, "bulkCommit") == false
      root = @rootForType(type)
      plural = @pluralize(root)
#      data = {}
#      data[plural] = models.map((model) ->
#          get model, "data"
#      )
      data = {}
      data = models.map((model) ->
          get model, "data"
      )
      @ajax "/" + @pluralize(root), "POST",
        data: JSON.stringify(data)
        success: (json) ->
          store.didCreateRecords type, models, json[plural]

    updateRecord: (store, type, model) ->
      id = get(model, "id")
      root = @rootForType(type)
      data = {}
      data[root] = get(model, "data")
      url = [ "", @pluralize(root), id ].join("/")
      @ajax url, "PUT",
        data: data
        success: (json) ->
          store.didUpdateRecord model, json[root]

    updateRecords: (store, type, models) ->
      return @_super(store, type, models)  if get(this, "bulkCommit") == false
      root = @rootForType(type)
      plural = @pluralize(root)
      data = {}
      data[plural] = models.map((model) ->
          get model, "data"
      )
      @ajax "/" + @pluralize(root), "PUT",
        data: data
        success: (json) ->
          store.didUpdateRecords models, json[plural]

    deleteRecord: (store, type, model) ->
      id = get(model, "id")
      root = @rootForType(type)
      url = [ "", @pluralize(root), id ].join("/")
      @ajax url, "DELETE", success: (json) ->
        store.didDeleteRecord model

    deleteRecords: (store, type, models) ->
      return @_super(store, type, models)  if get(this, "bulkCommit") == false
      root = @rootForType(type)
      plural = @pluralize(root)
      primaryKey = getPath(type, "proto.primaryKey")
      data = {}
      data[plural] = models.map((model) ->
          get model, primaryKey
      )
      @ajax "/" + @pluralize(root) + "/delete", "POST",
        data: data
        success: (json) ->
          store.didDeleteRecords models

    find: (store, type, id) ->
      root = @rootForType(type)
      url = [ "", @pluralize(root), id ].join("/")
      @ajax url, "GET", success: (json) ->
        store.load type, json

    findMany: (store, type, ids) ->
      root = @rootForType(type)
      plural = @pluralize(root)
      @ajax "/" + plural, "GET",
        data: ids: ids
        success: (json) ->
          store.loadMany type, ids, json[plural]

      url = "/" + plural

    findAll: (store, type) ->
      root = @rootForType(type)
      plural = @pluralize(root)
      @ajax "/" + plural, "GET", success: (json) ->
        store.loadMany type, json[plural]

    findQuery: (store, type, query, modelArray) ->
      root = @rootForType(type)
      plural = @pluralize(root)
      @ajax "/" + plural, "GET",
        data: query
        success: (json) ->
          modelArray.load json[plural]

    plurals: {}
    pluralize: (name) ->
      @plurals[name] or name + "s"

    rootForType: (type) ->
      return type.url  if type.url
      parts = type.toString().split(".")
      name = parts[parts.length - 1]
      name.replace(/([A-Z])/g, "_$1").toLowerCase().slice 1

    ajax: (url, type, hash) ->
      hash.url = URL_PREFIX + url
      hash.type = type
      hash.dataType = "json"
      hash.contentType = "application/json"
      jQuery.ajax hash
  )
