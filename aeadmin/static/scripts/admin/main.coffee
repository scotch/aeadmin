define [
  # Ember
  'lib/ember'
  'lib/ember-data'
  # Models
  'cs!admin/models/config'
  # Templates
  'text!admin/templates/layout.hjs'
  'text!admin/templates/index.hjs'
  'text!admin/templates/config/layout.hjs'
  'text!admin/templates/config/edit.hjs'
  'text!admin/templates/config/index.hjs'
  'text!admin/templates/config/new.hjs'
], (Em, DS, Config, layoutTmpl, indexTmpl, cLayoutTmpl, cEditTmpl, cIndexTmpl, cNewTmpl) ->

  # Register Templates
  Em.TEMPLATES['main-layout'] = Em.Handlebars.compile(layoutTmpl)
  Em.TEMPLATES['index'] = Em.Handlebars.compile(indexTmpl)
  Em.TEMPLATES['config-layout'] = Em.Handlebars.compile(cLayoutTmpl)
  Em.TEMPLATES['config-edit'] = Em.Handlebars.compile(cEditTmpl)
  Em.TEMPLATES['config-index'] = Em.Handlebars.compile(cIndexTmpl)
  Em.TEMPLATES['config-new'] = Em.Handlebars.compile(cNewTmpl)

  # Create App
  App = Em.Application.create
    VERSION: '0.0.1'

  # Setup Store
  App.store = DS.Store.create
    revision: 2
    adapter: DS.RESTAdapter.create(namespace: 'admin/api/v1')

  ## Models ##
  App.Config = Config
  App.configs = App.store.findAll(App.Config)

  ## Controllers ##
  App.siteConfigController = Em.Object.create

    content: (->
      return App.store.find(App.Config, 'application')
    ).property()

  # Layouts
  # Register Layouts
  App.layout = Em.View.create
    templateName: 'main-layout'
    classNames: ['.wrapper']

  # Home Layout View
  App.HomeLayoutView = Em.View.extend
    templateName: 'index'

  # Config Views
  App.ConfigLayoutView = Em.View.extend
    templateName: 'config-layout'
    create: (e)->
      e.preventDefault()
      console.log 'create clicked'
      App.states.goToState('configs.detail')

  # List View
  App.ConfigIndexView = Em.View.extend
    templateName: 'config-index'
    contentBinding: 'App.configs'
    detail: (e)->
      e.preventDefault()
      console.log 'Clicked entered showDetails'

  # New Controller View
#  App.configNewController = App.store.createRecord(App.Config, {})

  # Create View
  App.ConfigNewView = Em.View.extend
    templateName: 'config-new'
    nameBinding: 'App.configNewController.content.name'
    descriptionBinding: 'App.configNewController.content.description'
    priceBinding: 'App.configNewController.content.price'
    save: (e)->
      e.preventDefault()
      console.log 'Clicked save'
    cancel: (e)->
      e.preventDefault()
      console.log 'Clicked cancel'

  # Edit View
  App.ConfigEditView = Em.View.extend
    templateName: 'config-edit'
    save: (e)->
      e.preventDefault()
      console.log 'Clicked save'
    cancel: (e)->
      e.preventDefault()
      console.log 'Clicked cancel'

  # Detail View
  App.ConfigShowView = Em.View.extend
    templateName: 'config-show'

  # Route Manager
  App.routeManager = Em.RouteManager.create
    wantsHistory: true
    rootView: App.layout
    index: Em.LayoutState.create
      #selector: '.home'
      #route: 'home'
      viewClass: App.HomeLayoutView
    #shop: App.NavState.create
      #selector: '.shop'
      #path: 'layout-nesting'
      #viewClass: Em.View.create(templateName: 'store')
      #eggs: App.SubNavState.create
        #path: 'section1'
        #viewClass: Em.View.extend
          #title: 'Section 1'
          #templateName: 'section'
      #honey: App.SubNavState.create
        #path: 'honey'
        #viewClass: Em.View.extend
          #title: 'Honey'
          #templateName: 'section'
    configs: Em.LayoutState.create
      route: 'config'
      viewClass: App.ConfigLayoutView

      index: Em.LayoutState.create
        viewClass: App.ConfigIndexView
        enter: (stateManager, transition)->
          @_super(stateManager, transition)
          params = stateManager.get('params')

      new: Em.LayoutState.create
        route: 'new'
        viewClass: App.ConfigNewView
        enter: (stateManager, transition)->
          @_super(stateManager, transition)
          p = App.Config.create()
          @get('view').set('content', p)

      edit: Em.LayoutState.create
        route: ':id'
        viewClass: App.ConfigEditView
        enter: (stateManager, transition)->
          @_super(stateManager, transition)
          params = stateManager.get('params')
          configId = params.id

          p = App.configs.get('firstObject')
          if p
            console.log "firstObject"
            console.log(p.get('application_title'))
          p = App.store.find(App.Config, configId)
          if p
            console.log(p.get('application_title'))
          @get('view').set('content', p)

  App.layout.replaceIn '#content'
  return App
