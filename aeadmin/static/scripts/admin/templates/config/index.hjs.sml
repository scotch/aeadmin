
table.table.table-striped
  thead
    tr
      th | ID
      th | Name
      th | SKU
      th | Description
      th | Price
      th | Qty
  tbody
    {{#each App.products }}
    tr
      td | {{id}}
      td | {{name}}
      td | {{sku}}
      td | {{description}}
      td | {{price}}
      td | {{qty}}
    {{/each}}
