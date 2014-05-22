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
