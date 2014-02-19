Form = {}  if typeof Form is "undefined"

Form.setErrorToSession = (name, value) ->
  formErrors = undefined
  formErrors = Session.get("formErrors") or {}
  formErrors[name] = value
  Session.set "formErrors", formErrors

Form.setFormError = (name, value) ->
  key = undefined
  val = undefined
  _results = undefined
  if _.isObject(name)
    _results = []
    for key of name
      val = name[key]
      _results.push @setErrorToSession(key, val)
    _results
  else
    @setErrorToSession name, value

Form.getErrorClassForField = (name) ->
  formErrors = undefined
  formErrors = Session.get("formErrors")
  return ""  unless formErrors
  return "has-error"  if formErrors[name]
  ""

Form.removeFormError = (name) ->
  formErrors = undefined
  formErrors = Session.get("formErrors")
  return  unless formErrors
  return Session.set("formErrors", null)  if arguments.length is 0
  delete formErrors[name]

  Session.set "formErrors", formErrors

Form.getHelpTextForField = (name) ->
  formErrors = undefined
  formErrors = Session.get("formErrors")
  return ""  unless formErrors
  formErrors[name] or ""

Form.helpTextVisibleStyle = (name) ->
  formErrors = undefined
  formErrors = Session.get("formErrors")
  return ""  unless formErrors
  return 'none' unless formErrors
  'block'


Form.createFormDataFromSchema = (model) ->
  schema = model.schema
  form = {template: "baseForm", formFields: []}
  for key, value of schema.fields
    if value.form
      form.formFields.push( _.extend({name: key, value: model.get(key)}, getFormValues(key, value.form, model) ))

  form.actionsPosition = 'right'
  form.actions = [{ template:'formActionButton', btnClass: 'default', type: 'submit', name: 'Save' }]

  return form

getFormValues = (key, form, model) ->
  options = {}

  for key, value of form
    if _.isFunction(value)
      options[key] = value(model)
    else if _.isArray(value)
      options[key] = []
      for opt in value
        options[key].push(getFormValues(key, opt, model))
    else
      options[key] = value

  return options

noLineBreaks = (str) ->
  noStr = str.replace(/(\r\n|\n|\r)/gm, '')
  return noStr

###
Template.controlGroupWithTextareaMaxChars.created = ->
  if @data.value
    Session.set "charsLeft" + @data.name, @data.maxChars - noLineBreaks(@data.value).length
  else
    Session.set "charsLeft" + @data.name, @data.maxChars

Template.controlGroupWithTextareaMaxChars.events "keyup textarea": (evt) ->
  str = undefined
  withoutLinebreaks = undefined
  evt.preventDefault()
  str = $(evt.target).val()
  withoutLinebreaks = noLineBreaks(str)
  Session.set "charsLeft" + @name, @maxChars - withoutLinebreaks.length

Template.baseForm.actionsRight = () ->
  return true if @actionsPosition is 'right'

Template.controlGroupWithMultipleRemovableInput.noInput = () ->
  console.log 'controlGroupWithMultipleRemovableInput', @
  @values.length is 0

Template.controlGroupWithMultipleRemovableInput.getLastIndex = () ->
  context = {
    removeHtml: @removeHtml
    name: @name + '.' + @values.length
  }
  console.log 'with', context
  return context

###