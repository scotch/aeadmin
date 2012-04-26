
h2 | Config
.row
  .span2
    ul.nav.nav-pills.nav-stacked
      {{#each App.configs}}
      li > a href="#/config/{{unbound id}}" | {{id}}
      {{/each}}
  .span10
    {{dynamicView}}
