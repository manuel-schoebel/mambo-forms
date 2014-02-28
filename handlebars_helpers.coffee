Handlebars.registerHelper "setErrorClass", ->
  Form.getErrorClassForField @inputName

Handlebars.registerHelper "helpTextVisibleStyle", (inputName) ->
  return Form.helpTextVisibleStyle(inputName) if _.isString(inputName)
  Form.helpTextVisibleStyle @inputName

Handlebars.registerHelper "getHelpTextForField", (inputName) ->
  return Form.getHelpTextForField(inputName)  if _.isString(inputName)
  return Form.getHelpTextForField(@inputName)
  return @errorMessage  if Form.fieldHasError(@inputName)
  @successMessage

Handlebars.registerHelper "getCharsLeftClass", ->
  "text-danger" if Session.get("charsLeft" + @inputName) < 0

Handlebars.registerHelper "charsLeft", ->
  Session.get "charsLeft" + @inputName

Handlebars.registerHelper "renderFormField", (options) ->
  Template[options.template].withData(options)

Handlebars.registerHelper "renderInputTemplate", (tpl) ->
  Template[tpl].withData(@inputTemplate)

Handlebars.registerHelper "renderForm", (options) ->
  Template[options.template].withData(options)

Handlebars.registerHelper "renderFormAction", (options) ->
  Template[options.template].withData(options)

Handlebars.registerHelper "renderFormByModel", (model) ->
  formData = Form.createFormDataFromSchema(model)
  Template[formData.template].withData(formData)

Handlebars.registerHelper "isSelected", () ->
  console.log 'isSelected?', @, arguments
  options.fn() if @selected
