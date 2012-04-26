form.form-horizontal
  fieldset
    legend | New Product
    .control-group
      label.control-label for="name" | Name
      .controls
        {{view Em.TextField valueBinding="App.productNewController.name"}}
    .control-group
      label.control-label for="description" | Description
      .controls
        {{view Em.TextField valueBinding="App.productNewController.description"}}
    .control-group
      label.control-label for="price" | Price
      .controls
        {{view Em.TextField valueBinding="App.productNewController.price"}}
    .form-actions
      button.btn.btn-primary {{action "save"}} | Save
      button.btn {{action "cancel"}} | Cancel
