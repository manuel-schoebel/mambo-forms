Handlebars.registerHelper "renderFormField", (options) ->
  new Handlebars.SafeString(Template[options.template](options))

Handlebars.registerHelper "setErrorClass", ->
  Form.getErrorClassForField @name

Handlebars.registerHelper "getHelpTextForField", (name) ->
  return Form.getHelpTextForField(name)  if _.isString(name)
  return Form.getHelpTextForField(@name)
  return @errorMessage  if Form.fieldHasError(@name)
  @successMessage

Handlebars.registerHelper "renderInputTemplate", (tpl) ->
  new Handlebars.SafeString(Template[tpl](@inputTemplate))

Handlebars.registerHelper "renderForm", (options) ->
  console.log 'renderForm', options
  new Handlebars.SafeString(Template[options.template](options))

Handlebars.registerHelper "renderFormAction", (options) ->
  new Handlebars.SafeString(Template[options.template](options))

Handlebars.registerHelper "helpTextVisibleStyle", (name) ->
  return Form.helpTextVisibleStyle(name)  if _.isString(name)
  Form.helpTextVisibleStyle @name

Handlebars.registerHelper "getCharsLeftClass", ->
  "text-danger" if Session.get("charsLeft" + @name) < 0

Handlebars.registerHelper "charsLeft", ->
  Session.get "charsLeft" + @name

Handlebars.registerHelper "renderFormByModel", (model) ->
  console.log "renderFormBySchema", arguments
  formData = Form.createFormDataFromSchema(model)
  new Handlebars.SafeString(Template[formData.template](formData))
