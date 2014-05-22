mambo-forms
===========

#Form renderer
With the template helper {{> renderForm formOptions}} you can render a form.

    <template name="templateWithAForm">
      {{>renderForm formOptions}}
    </template>
    
    Template.templateWithAForm.helpers({
      formOptions: ->
        title: 'A h1 Title for the form'
        formHint:
          alertType: 'warning'
          text: 'Something'
        formFields: [
          ...
        ]
        actions: [
          ...
        ]
    })

#Render single form element

    <template name="someTemplate">
        {{#with inputOptions}}
        {{> input}}
        {{/with}}
    </template>
    
    Template.someTemplate.helpers {
        inputOptions: ->
            label: 'Some Label'
            formHint: 'Some hint'
            inputName: 'nameOfInput'
            type: 'text'
            placeholder: 'Write something'
    }

#Field Errors

Errors for fields are automatically shown if they are in the Session-Variable called 'formErrors'. Simply use the name of the input field as the key and the error message as the value.

    Session.get('formErrors')
    ->
    {
        "email": "This is not a valid email",
        "street": "Please enter a valid street name"
    }

In order to remove all Form errors use

    Form.removeFormError()

Remove only one form error

    Form.removeFormError('email')


#Form Fields

###Input

    {{>input}}

    label: String
    formHint: String
    inputName: String
    type: String
    placeholder: String

##Textarea

    {{>textarea}}
    
    label: String
    inputName: String
    placeholder: String
    
##Select

    {{>select}}
    
    label: Optional String
    inputName: String
    options: Array [{key: String, selected: Boolean, label: String, attributes: String}]


##TODO other fields
