form.form-horizontal
  fieldset
    legend | {{content.id}}
    .control-group
      label.control-label for="name" | Application Title
      .controls
        {{view Em.TextField valueBinding="content.application_title"}}
    .control-group
      label.control-label for="name" | Secret Key
      .controls
        {{view Em.TextField valueBinding="content.secret_key"}}
    .control-group
      label.control-label for="name" | default_from_email
      .controls
        {{view Em.TextField valueBinding="content.default_from_email"}}
    .control-group
      label.control-label for="name" | Application Title
      .controls
        {{view Em.TextField valueBinding="content.application_title"}}

    .form-actions
      button.btn.btn-primary {{action "save"}} | Save
      button.btn {{action "cancel"}} | Cancel

