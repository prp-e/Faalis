Resource = angular.module "ResourceFactory", []

Resource.provider "Resources", [->

  # resources should be an array of resource factories
  @resources = undefined

  # This field will specify the main resource class
  # for current functionality. First element of
  # @resource will be used if `main_resource` was undefined
  @main_resource = undefined


  this.$get = [->

    main_resource = @main_resources || @resources[0]
    resources = @resources

    # Public injector to inject required services into
    # resources `initialize` method.
    $injector = angular.injector(['ng'])

    obj = {}

    for resource in resources
      unless resource.name?
        throw "Resource '" + resource + "' does not have a 'name'"

      unless resource.initialize?
        throw "Resource '" + resource.name + "' does not have 'initialize' method."

      $injector.invoke(resource.initialize)
      obj[resource.name.underscore()] = resource

    obj.main_resource = ->
      return main_resource

    obj.all = ->
      return resources

    return obj
  ]
  return
]
