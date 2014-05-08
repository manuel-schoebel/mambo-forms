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

Handlebars.registerHelper "renderFormField", () ->
  backwardCompat =
    'controlGroupWithInput': 'input'
    'controlGroupWithTextarea': 'textarea'
    'controlGroupWithSelect': 'select'
    'controlGroupWithInlineRadio': 'radio'
    'controlGroupWithCheckbox': 'checkbox'
  tpl = if backwardCompat[@template] then backwardCompat[@template] else @template
  return Template[tpl]

Handlebars.registerHelper "renderForm", () ->
  Template[@template]

Handlebars.registerHelper "renderFormAction", (options) ->
  backwardCompat =
    'formActionButton': 'button'
  tpl = if backwardCompat[@template] then backwardCompat[@template] else @template
  Template[tpl]
